//
//  File.swift
//  
//
//  Created by Daniel Fourie on 05/08/2024.
//

import Foundation

public struct APIBook2: Decodable, Equatable {
    
    public let isbn10: String
    public let isbn13: String
    
    public let title_short: String
    
    public let coverImageURL: URL
    
}
