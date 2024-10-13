//
//  View.swift
//  SwiftUI-CustomPlayground
//
//  Created by Prashanna Rajbhandari on 11/10/2024.
//

import SwiftUI
import Foundation

extension View {
    func toast(message: LocalizedStringKey, show: Binding<Bool>, textColor: Color = Color.white, backgroundColor: Color = Color.black, showTime: Double = 2) -> some View {
        modifier(
            ToastMessageViewModifier(
                show: show,
                toastMessageView: ToastMessageView(
                    show: show,
                    message: message,
                    textColor: textColor,
                    backgroundColor: backgroundColor,
                    showTime: showTime
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
