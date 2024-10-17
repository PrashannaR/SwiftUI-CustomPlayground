//
//  ToastViewModifier.swift
//  SwiftUI-CustomPlayground
//
//  Created by Prashanna Rajbhandari on 11/10/2024.
//

import Foundation
import SwiftUI

struct ToastMessageView: View {
    @Binding var show: Bool
    let message: LocalizedStringKey
    var textColor = Color.white
    var backgroundColor = Color.black
    var showTime: Double = 2
    var edge: Edge = .bottom

    var body: some View {
        if edge == .bottom {
            toastFromBotton()
        } else {
            toastFromTop()
        }
    }
}

struct ToastMessageViewModifier: ViewModifier {
    @Binding var show: Bool
    let toastMessageView: ToastMessageView

    func body(content: Content) -> some View {
        ZStack {
            content
            if show {
                toastMessageView
            }
        }
    }
}

extension ToastMessageView {
    private func toastFromBotton() -> some View {
        VStack {
            Spacer()
            Text(message)
                .foregroundStyle(textColor)
                .font(.headline)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(backgroundColor)
                .cornerRadius(20)
        }
        .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
        .onTapGesture {
            withAnimation {
                self.show = false
            }
        }.onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + showTime) {
                withAnimation {
                    self.show = false
                }
            }
        })
    }

    private func toastFromTop() -> some View {
        ZStack {
            VStack {
                Text(message)
                    .foregroundStyle(textColor)
                    .font(.headline)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(backgroundColor)
                    .cornerRadius(20)
                Spacer()
            }
            .padding(.top, UIScreen.main.bounds.height * 0.07)
        }
        .ignoresSafeArea()
        .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
        .onTapGesture {
            withAnimation {
                self.show = false
            }
        }.onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + showTime) {
                withAnimation {
                    self.show = false
                }
            }
        })
    }
}
