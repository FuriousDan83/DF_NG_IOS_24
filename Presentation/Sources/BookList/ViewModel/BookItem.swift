//
//  File.swift
//  
//
//  Created by Daniel Fourie on 05/08/2024.
//

import Entities
import Foundation

public struct BookItem: Identifiable, Equatable {
    
    public let isbn10: String
    public let isbn13: String
    
    public let title_short: String
    
    public let coverImage: Image { get }
    
    public init(book: Book) {
        self.isbn10 = book.isbn10
        self.isbn13 = book.isbn13
        self.title_short = book.title_short
        self.coverImage = book.coverImage
    }
}

#if DEBUG
extension BookItem {
    
    static let mock = BookItem(book: MockBook.single)
}
#endif
