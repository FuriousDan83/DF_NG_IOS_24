//
//  File.swift
//  
//
//  Created by Daniel Fourie on 05/08/2024.
//

import Entities
import Foundation

public struct MockBookItem: Book, Equatable {
    public static func == (lhs: MockBookItem, rhs: MockBookItem) -> Bool {
        lhs.isbn10 == rhs.isbn10 || lhs.isbn13 == rhs.isbn13
    }
    
    
    public var isbn10: String
    public var isbn13: String
    
    public var title_short: String
    
    public var coverImage: CoverImage
}

public extension MockBookItem {
    
    static var single = MockBookItem(
        isbn10: "0575097361",
        isbn13: "0575097361",
        title_short: "The Way of Kings, Part One (Stormlight Archive)",
        coverImage: MockImage(image: "https://images.isbndb.com/covers/73/60/9780575097360.jpg")
    )
}
