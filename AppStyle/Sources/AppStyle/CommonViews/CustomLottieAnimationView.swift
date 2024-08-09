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
    
    public func makeUIView(context: UIViewRepresentableContext<CustomLottieAnimationView>) -> some UIView {
        let view  = UIView()
        
        let animationView = LottieAnimationView()
        let animation = LottieAnimation.named("BookLottie", bundle: Bundle.module)
        
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.frame = view.frame
        animationView.backgroundBehavior = .pauseAndRestore
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = UIColor.blue
        view.addSubview(animationView)
        view.bringSubviewToFront(animationView)
        
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
