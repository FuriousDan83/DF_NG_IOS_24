//
//  File.swift
//  
//
//  Created by Daniel Fourie on 08/08/2024.
//

import Foundation
import Lottie
import SwiftUI

public struct CustomLottieAnimationView: UIViewRepresentable {
    var fileName: String
    var loopMode: LottieLoopMode = .loop
    
    public func makeUIView(context: Context) -> some UIView {
        let view  = UIView()
        let animationView = LottieAnimationView()
        animationView.animation = LottieAnimation.named(AppStyle.Lottie.bookLottie)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        return view
    }
    
    public func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    public init(fileName: String, loopMode: LottieLoopMode) {
        self.fileName = fileName
        self.loopMode = loopMode
    }
}
