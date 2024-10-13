//
//  Toast.swift
//  SwiftUI-CustomPlayground
//
//  Created by Prashanna Rajbhandari on 11/10/2024.
//

import SwiftUI

struct ExampleView: View {
    @State var showToast: Bool = false
    @State var showSnackbar: Bool = false
    var body: some View {
        VStack {
            Button("Toggle Toast") {
                showToast.toggle()
            }

            Button("Toggle Snackbar") {
                showSnackbar.toggle()
            }
        }
        // .toast(message: "Test Toast", show: $showToast)
        .toast(message: "Test Toast", show: $showToast, textColor: .white, backgroundColor: .blue)
        // .snackBar(message: "Test Snackbar", show: $showSnackbar)
        .snackBar(message: "Test Snackbar", show: $showSnackbar, textColor: .white, backgroundColor: .blue)
    }
}

#Preview {
    ExampleView()
}
