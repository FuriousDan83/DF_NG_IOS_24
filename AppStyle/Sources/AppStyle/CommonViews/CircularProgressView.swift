//
//  File.swift
//  
//
//  Created by Daniel Fourie on 05/08/2024.
//

import SwiftUI

public struct CircularProgressView: View {
    
    private let progress: Double
    private let tint: Color
    
    public var body: some View {
        Circle()
            .trim(from: 0.0, to: progress)
            .stroke(tint, lineWidth: 4.0)
            .frame(width: 48.0, height: 48.0)
    }
    
    public init(progress: Double, tint: Color = Color.blue) {
        self.progress = progress
        self.tint = tint
    }
}
