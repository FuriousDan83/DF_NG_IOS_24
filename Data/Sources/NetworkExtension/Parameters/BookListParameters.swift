//
//  File.swift
//  
//
//  Created by Daniel Fourie on 04/08/2024.
//

public struct BookListParameters: Parameterable {
    
    public let perPage: Int
    public let page: Int
    public let query: String
}
