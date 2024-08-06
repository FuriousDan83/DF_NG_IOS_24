//
//  File.swift
//  
//
//  Created by Daniel Fourie on 05/08/2024.
//

import Foundation

public struct APIBook: Decodable, Equatable {
    
    public let isbn10: String
    public let isbn13: String
    
    public let title_short: String
    
    public let coverImageURL: URL
    
    enum APIBookCodingKeys: String, CodingKey {
        case isbn10, isbn13
        case title_short
        case coverImageURL
    }
}
