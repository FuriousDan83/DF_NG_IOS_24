//
//  File.swift
//  
//
//  Created by Daniel Fourie on 05/08/2024.
//

import Combine

public final class BookListState: ObservableObject {
    
    @Published public var didSelectBook: String?
    
    public init() { }
}
