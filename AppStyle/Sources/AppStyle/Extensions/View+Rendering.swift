//
//  File.swift
//  
//
//  Created by Daniel Fourie on 05/08/2024.
//

import SwiftUI

private struct RenderIfModifier: ViewModifier {
    
    private let condition: Bool
    
    init(_ condition: Bool) {
        self.condition = condition
    }
    
    func body(content: Content) -> some View {
        if condition {
            content
        }
    }
}

public extension View {
    
    func renderIf(_ condition: Bool) -> some View {
        modifier(RenderIfModifier(condition))
    }
}
