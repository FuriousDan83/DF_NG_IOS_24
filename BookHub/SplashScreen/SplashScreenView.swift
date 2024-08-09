//
//  SplashScreenView.swift
//  BookHub
//
//  Created by Daniel Fourie on 07/08/2024.
//

import SwiftUI
import Lottie
import AppStyle

struct SplashScreenView: View {
    
    @State var isActive: Bool = false
    var animationFileName: String
    
    public init() {
        self.animationFileName = AppStyle.Lottie.bookLottie
    }
    var body: some View {
        ZStack {
            if self.isActive {
                AppView()
            } else {
                SplashBackgroundView()
                
                VStack {
                    SplashTextView()
                    
                    
                }
            }
        }
        .onAppear {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                self.isActive = true
//            }
        }

    }
}

#Preview {
    SplashScreenView()
}
