//
//  ViewUtils.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 25/06/23.
//

import Combine
import SwiftUI
import UIKit

typealias TimePublisher = Publishers.Autoconnect<Timer.TimerPublisher>

extension View {
    func onReceive(timer: TimePublisher?, perform action: @escaping (Timer.TimerPublisher.Output) -> Void) -> some View {
        Group {
            if let timer = timer {
                self.onReceive(timer, perform: { value in
                    action(value)
                })
            } else {
                self
            }
        }
    }
    
    @ViewBuilder
    func onValueChange<T: Equatable>(of value: T, perform completion: @escaping (T) -> Void) -> some View {
        if #available(iOS 14.0, *) {
            self.onChange(of: value, perform: completion)
        } else {
            modifier(OnChangeObserver(value: value, action: completion))
        }
    }
    
    /// Hide or show the view based on a boolean value.
    ///
    /// Example for visibility:
    ///
    ///     Text("Label")
    ///         .isHidden(true)
    ///
    /// Example for complete removal:
    ///
    ///     Text("Label")
    ///         .isHidden(true, remove: true)
    ///
    /// - Parameters:
    ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
    ///   - remove: Boolean value indicating whether or not to remove the view.
    @ViewBuilder
    func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
    
}


/// Helper method to calculate content size
extension View {
    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
            }
        )
        .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }
}


struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

public struct OnChangeObserver<V: Equatable>: ViewModifier {

    public init(value: V, action: @escaping (V) -> Void) {
        self.value = value
        self.action = action
    }
    private typealias Action = (V) -> Void
    private let value: V
    private let action: Action

    @State private var state: (V, Action)?

    public func body(content: Content) -> some View {
        if #available(iOS 14, *) {
            assertionFailure("Please don't use this ViewModifer directly and use the `onChange(of:perform:)` modifier instead.")
        }
        return content
            .onAppear()
            .onReceive(Just(value)
                .receive(on: DispatchQueue.main)) { newValue in
                    if let (currentValue, action) = state, newValue != currentValue {
                        action(newValue)
                    }
                    state = (newValue, action)
                }
    }
}

extension UIDevice {
    
    static var portraitWidth: CGFloat {
        let screenSize = UIScreen.main.bounds
        return min(screenSize.width, screenSize.height)
    }
    
    static var landscapeWidth: CGFloat {
        let screenSize = UIScreen.main.bounds
        return max(screenSize.width, screenSize.height)
    }
}
