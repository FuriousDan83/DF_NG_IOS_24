//
//  File.swift
//  
//
//  Created by Daniel Fourie on 05/08/2024.
//

import Combine

public final class BookDetailState: ObservableObject {
    
    @Published public var isbn: String = ""
    @Published public var didSelectBack = false
    
    public init(isbn: String) {
        self.isbn = isbn
    }
}
