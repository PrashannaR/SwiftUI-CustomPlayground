//
//  SnackBarView.swift
//  SwiftUI-CustomPlayground
//
//  Created by Prashanna Rajbhandari on 13/10/2024.
//

import Foundation
import SwiftUI

struct SnackBarView: View {
    @Binding var show: Bool
    let message: LocalizedStringKey
    var textColor = Color.white
    var backgroundColor = Color.black
    var showTime: Double = 2

    var body: some View {
        VStack {
            Spacer()

            Text(message)
                .foregroundStyle(textColor)
                .font(.headline)
                .padding()
                .frame(width: UIScreen.main.bounds.width * 0.8)
                .background(backgroundColor)
                .cornerRadius(8)
        }
        .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity)
        )
        .onTapGesture {
            withAnimation {
                self.show = false
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + showTime) {
                withAnimation {
                    self.show = false
                }
            }
        }
    }
}

struct SnackBarViewModifier: ViewModifier {
    @Binding var show: Bool
    let snackBarView: SnackBarView

    func body(content: Content) -> some View {
        ZStack {
            content
            if show {
                snackBarView
            }
        }
    }
}
