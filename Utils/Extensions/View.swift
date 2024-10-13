//
//  View.swift
//  SwiftUI-CustomPlayground
//
//  Created by Prashanna Rajbhandari on 11/10/2024.
//

import Foundation

import SwiftUI

extension View {
    func toast(message: LocalizedStringKey, show: Binding<Bool>, textColor: Color = Color.white, backgroundColor: Color = Color.black) -> some View {
        modifier(
            ToastMessageViewModifier(
                show: show,
                toastMessageView: ToastMessageView(
                    show: show,
                    message: message,
                    textColor: textColor,
                    backgroundColor: backgroundColor
                )
            )
        )
    }

    func snackBar(message: LocalizedStringKey, show: Binding<Bool>, textColor: Color = Color.white, backgroundColor: Color = Color.black) -> some View {
        modifier(
            SnackBarViewModifier(
                show: show,
                snackBarView: SnackBarView(
                    show: show,
                    message: message,
                    textColor: textColor,
                    backgroundColor: backgroundColor
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
