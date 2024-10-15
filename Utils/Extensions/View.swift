//
//  View.swift
//  SwiftUI-CustomPlayground
//
//  Created by Prashanna Rajbhandari on 11/10/2024.
//

import SwiftUI
import Foundation

extension View {
    func toast(message: LocalizedStringKey, show: Binding<Bool>, textColor: Color = Color.white, backgroundColor: Color = Color.black, showTime: Double = 2, edge: Edge = .bottom) -> some View {
        modifier(
            ToastMessageViewModifier(
                show: show,
                toastMessageView: ToastMessageView(
                    show: show,
                    message: message,
                    textColor: textColor,
                    backgroundColor: backgroundColor,
                    showTime: showTime,
                    edge: edge
                )
            )
        )
    }

    func snackBar(message: LocalizedStringKey, show: Binding<Bool>, textColor: Color = Color.white, backgroundColor: Color = Color.black, showTime: Double = 2) -> some View {
        modifier(
            SnackBarViewModifier(
                show: show,
                snackBarView: SnackBarView(
                    show: show,
                    message: message,
                    textColor: textColor,
                    backgroundColor: backgroundColor,
                    showTime: showTime
                )
            )
        )
    }

    func onBackSwipe(perform action: @escaping () -> Void) -> some View {
        gesture(
            DragGesture()
                .onEnded({ value in
                    if value.startLocation.x < 50 && value.translation.width > 80 {
                        action()
                    }
                })
        )
    }
}


public extension View {
    /// Adds a slide in view onto the container view
    ///
    /// Create a manager:
    /// ```
    /// class SlideInViewManager: ObservableObject {
    ///     @Published var isActive: Bool = false
    /// }
    /// ```
    /// Initialize it:
    /// ```
    /// @StateObject private var slideInViewManager = SlideInViewManager()
    /// ```
    /// Use it:
    /// ```
    /// NavigationView {
    ///     HomeView()
    /// }
    /// .navigationViewStyle(.stack)
    /// .slideInView(isActive: $slideInViewManager.isActive) {
    ///     MenuView()
    ///         .edgesIgnoringSafeArea(.bottom)
    /// }
    /// .environmentObject(slideInViewManager)
    /// ```
    /// Access the `state` of the slide in view (`active` or `inactive`) or toggle the `state` from the `SlideInViewMananger` Envirinment Object
    /// ```
    /// @EnvironmentObject var slideInViewManager: SlideInViewManager
    /// ```
    /// - Parameters:
    ///   - isActive: binding to show/hide the slide in view
    ///   - edge: the slide in edge; default is `leading`
    ///   - paddingPercentage: the percentage of the slide in view's padding; default is `0.35`
    ///   - options: options; default is `SlideInViewOptions` defaults
    ///   - content: the slide in view content
    ///   - container: the container the slide in view will be presented on top of
    /// - Returns: A view that has a slide in view
    func slideInView<Content: View>(isActive: Binding<Bool>, edge: Edge = .leading, paddingPercentage: CGFloat = 0.3, options: SlideInViewOptions = SlideInViewOptions(), content: @escaping () -> Content) -> some View {
        SlideInView(isActive: isActive, edge: edge, paddingPercentage: paddingPercentage, options: options, content: content) {
            self
        }
    }
}
