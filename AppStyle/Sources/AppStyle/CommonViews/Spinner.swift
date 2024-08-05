//
//  File.swift
//  
//
//  Created by Daniel Fourie on 05/08/2024.
//

import SwiftUI

private struct Spinner: ViewModifier {
    
    @Binding var isPresented: Bool
    @State private var rotatingDegrees = 0.0
    private let progress = 0.7
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
    }
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            CircularProgressView(progress: progress)
                .rotationEffect(.degrees(rotatingDegrees))
                .renderIf(isPresented)
                .onAppear {
                    withAnimation(
                        .linear(duration: 0.8)
                        .repeatForever(autoreverses: false)
                    ) {
                        rotatingDegrees = 360.0
                    }
                }
        }
        .disabled(isPresented)
    }
}

extension View {
    
    public func spinner(isPresented: Binding<Bool>) -> some View {
        modifier(Spinner(isPresented: isPresented))
    }
}
