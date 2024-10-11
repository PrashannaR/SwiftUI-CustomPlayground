//
//  ToastViewModifier.swift
//  SwiftUI-CustomPlayground
//
//  Created by Prashanna Rajbhandari on 11/10/2024.
//

import SwiftUI
import Foundation

struct ToastMessageView: View {
    @Binding var show: Bool
    let message: LocalizedStringKey
    
    var body: some View {
        VStack {
            Spacer()
            Text(message)
                .foregroundStyle(.white)
                .font(.headline)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color.black)
                .cornerRadius(20)
        }
        .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
        .onTapGesture {
            withAnimation {
                self.show = false
            }
        }.onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.show = false
                }
            }
        })
    }
}

struct ToastMessageViewModifier : ViewModifier {
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
