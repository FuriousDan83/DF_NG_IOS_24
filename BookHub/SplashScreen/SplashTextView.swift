//
//  SplashTextView.swift
//  BookHub
//
//  Created by Daniel Fourie on 09/08/2024.
//

import SwiftUI
import AppStyle

struct SplashTextView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("BookHub")
                .fontWeight(.black)
                .font(.system(size:40))
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            Color(Colours.accentSecondary.color),
                            Color(Colours.accentPrimary.color)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            
            Text("Your book search companion")
                .italic()
                .foregroundColor(Color(Colours.accentSecondary.color))
        }
    }
}

#Preview {
    SplashTextView()
}
