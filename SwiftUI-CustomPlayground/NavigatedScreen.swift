//
//  NavigatedScreen.swift
//  SwiftUI-CustomPlayground
//
//  Created by Prashanna Rajbhandari on 13/10/2024.
//

import SwiftUI

struct NavigatedScreen: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack {
                Text("This is the next screen")
                    .foregroundStyle(.black)
            }
        }
        .navigationBarBackButtonHidden()
        .onBackSwipe {
            dismiss()
        }
    }
}

#Preview {
    NavigatedScreen()
}
