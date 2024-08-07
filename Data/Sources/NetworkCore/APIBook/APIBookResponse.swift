//
//  File.swift
//  
//
//  Created by Daniel Fourie on 06/08/2024.
//

import Foundation
import Entities

public struct APIBookResponse: Decodable {
    public let total: Int
    public let books: [APIBook]
}

public struct APIBook: Decodable, Equatable, Book {
    public let isbn10: String
    public let isbn13: String
    
    public let title_short: String
    
    public let coverImageURL: URL
}

extension APIBookResponse {
    
    enum CodingKeys: String, CodingKey {
        case total = "total"
        case books = "books"
    }
}

extension APIBook {
    
    enum CodingKeys: String, CodingKey {
        case title_short = "title"
        case isbn10
        case isbn13
        case coverImageURL = "image"
    }
}
