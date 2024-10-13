//
//  Toast.swift
//  SwiftUI-CustomPlayground
//
//  Created by Prashanna Rajbhandari on 11/10/2024.
//

import SwiftUI

struct Toast: View {
    @State var showToast : Bool = false
    var body: some View {
        VStack{
            Button("Toggle Toast") {
                showToast.toggle()
            }
                
        }
        //.toast(message: "Test Toast", show: $showToast)
        .toast(message: "Test Toast", show: $showToast, textColor: .white, backgroundColor: .blue)
    }
}

#Preview {
    Toast()
}
