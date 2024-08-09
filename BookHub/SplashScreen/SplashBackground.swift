//
//  SplashView.swift
//  BookHub
//
//  Created by Daniel Fourie on 09/08/2024.
//

import SwiftUI
import AppStyle

struct SplashBackgroundView: View {
    var body: some View {
        ZStack {
            Color(Colours.tertiary.color)
                .ignoresSafeArea()
            
            Color(Colours.accentPrimary.color)
                .cornerRadius(40)
                .offset(y: 3)
                .opacity(0.98)
                .padding()
            
            LinearGradient(
                colors: [
                    Color(Colours.secondary.color),
                    Color(Colours.primary.color)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .cornerRadius(40)
            .padding()
        }
    }
}

#Preview {
    SplashBackgroundView()
}
