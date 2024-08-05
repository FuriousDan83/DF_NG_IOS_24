//
//  File.swift
//  
//
//  Created by Daniel Fourie on 05/08/2024.
//

import Entities
import Foundation
import SwiftUI
import DomainTestUtilities

public struct BookItem: Identifiable, Equatable {
    public static func == (lhs: BookItem, rhs: BookItem) -> Bool {
        lhs.id == rhs.id
    }
    
    public var id: String
    
    
    public let isbn10: String
    public let isbn13: String
    
    public let title_short: String
    
    public var coverImage: CoverImage
    
    public init(book: Book) {
        self.id = book.isbn13.isEmpty ? book.isbn10 : book.isbn13
        self.isbn10 = book.isbn10
        self.isbn13 = book.isbn13
        self.title_short = book.title_short
        self.coverImage = book.coverImage
    }
}

#if DEBUG
extension BookItem {
    
    static let mock = BookItem(book: MockBookItem.single)
}
#endif
