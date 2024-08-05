//
//  File.swift
//  
//
//  Created by Daniel Fourie on 05/08/2024.
//

import Foundation
import Entities
import DomainTestUtilities

public struct BookDetailItem: Equatable {
    public static func == (lhs: BookDetailItem, rhs: BookDetailItem) -> Bool {
        lhs.isbn10 == rhs.isbn10 || lhs.isbn13 == rhs.isbn13
    }
    
    
    public let isbn10: String
    public let isbn13: String
    
    public let title_short: String
    public let title_long: String
    public let binding: String
    public let publisher: String
    public let publishedDate: String
    public let edition: String
    public let language: String
    public let pages: Int
    public let coverImage: CoverImage
    public let synopsis: String
    public let authors: [String]
    
    public init(bookDetail: BookDetail) {
        self.isbn10 = bookDetail.isbn10
        self.isbn13 = bookDetail.isbn13
        self.title_short = bookDetail.title_short
        self.title_long = bookDetail.title_long
        self.binding = bookDetail.binding
        self.publisher = bookDetail.publisher
        self.publishedDate = bookDetail.published_date
        self.edition = bookDetail.edition
        self.language = bookDetail.language
        self.pages = bookDetail.pages
        self.coverImage = bookDetail.coverImage
        self.synopsis = bookDetail.synopsis
        self.authors = bookDetail.authors
    }
}

#if DEBUG
extension BookDetailItem {
    static let mock = BookDetailItem(bookDetail: MockBookDetail.single)
}
#endif
