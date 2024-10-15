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
    @State var showSlideMenuTrailing: Bool = false
    @State var showSlideMenuLeading: Bool = false
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white
                    .ignoresSafeArea()

                VStack {
                    Button("Toggle Toast") {
                        showToast.toggle()
                    }

                    Button("Toggle Snackbar") {
                        showSnackbar.toggle()
                    }
                    
                    NavigationLink(destination: NavigatedScreen()) {
                        Text("Navigated to Screen")
                    }
                    
                    
                }
            }
        }
        
        // .toast(message: "Test Toast", show: $showToast)
        .toast(message: "Test Toast", show: $showToast, textColor: .white, backgroundColor: .blue)
        // .snackBar(message: "Test Snackbar", show: $showSnackbar)
        .snackBar(message: "Test Snackbar", show: $showSnackbar, textColor: .white, backgroundColor: .blue, showTime: 1.5)
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showSlideMenuTrailing.toggle()
                } label: {
                    Image(systemName: "sidebar.right")
                        .foregroundStyle(.blue)
                }

            }
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    showSlideMenuLeading.toggle()
                } label: {
                    Image(systemName: "sidebar.left")
                        .foregroundStyle(.blue)
                }

            }
        })
        .slideInView(isActive: $showSlideMenuTrailing, edge: .trailing) {
            ExampleSlideMenuContent()
        }
        .slideInView(
            isActive: $showSlideMenuLeading,
            edge: .leading,
            paddingPercentage: 0.45,
            options: SlideInViewOptions(
                paddingColor: Color.green,
                paddingColorOpacity: 0.45,
                shouldDismissUponSwipe: true,
                shouldDismissUponExternalTap: true)) {
                ExampleSlideMenuContent()
            }
    }
}

#Preview {
    NavigationStack{
        ExampleView()
    }
}
