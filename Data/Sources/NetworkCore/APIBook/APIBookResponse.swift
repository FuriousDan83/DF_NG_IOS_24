//
//  File.swift
//  
//
//  Created by Daniel Fourie on 06/08/2024.
//

import Foundation

public struct APIBookResponse: Decodable, Equatable {
    
    public let total: Int
    public let books: [APIBook]
    
}

extension APIBookResponse {
    
    enum CodingKeys: String, CodingKey {
        case total, books
    }
}
