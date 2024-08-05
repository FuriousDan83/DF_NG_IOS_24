//
//  File.swift
//  
//
//  Created by Daniel Fourie on 03/08/2024.
//

public protocol BookDetail {
    
    var isbn10: String { get }
    var isbn13: String { get }
    
    var title_short: String { get }
    var title_long: String { get }
    var binding: String { get }
    var publisher: String { get }
    var published_date: Date { get }
    var edition: String { get }
    var language: String { get }
    var pages: Int { get }
    var coverImage: CoverImage { get }
    var synopsis: String { get }
    var authors: [String] { get }
}
