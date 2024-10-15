//
//  ExampleSlideMenuContent.swift
//  SwiftUI-CustomPlayground
//
//  Created by Prashanna Rajbhandari on 16/10/2024.
//

import SwiftUI

struct ExampleSlideMenuContent: View {
    var body: some View {
        ZStack{
            Color.blue
                .ignoresSafeArea()
            
            VStack{
                Text("Example Slide Menu")
                    .font(.title)
                    .padding()
                
                Text("This is an example of a slide menu. You can use it to display a menu on the side of the screen.")
                    .multilineTextAlignment(.leading)
                    .padding()
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    ExampleSlideMenuContent()
}
