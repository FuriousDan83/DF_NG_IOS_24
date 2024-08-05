//
//  File.swift
//  
//
//  Created by Daniel Fourie on 05/08/2024.
//

public struct APIBookDetail: Decodable, Equatable {
    
    public let isbn10: String
    public let isbn13: String
    
    public let title_short: String
    public let title_long: String
    public let binding: String
    public let publisher: String
    public let published_date: String
    public let edition: String
    public let language: String
    public let pages: Int
    public let apiCoverImage: APIImage
    public let synopsis: String
    public let authors: [String]
}

extension APIBookDetail {
    
    enum CodingKeys: String, CodingKey {
        case title_short = "title"
        case title_long
        case isbn10 = "isbn"
        case isbn13, binding, publisher, language
        case published_date = "date_published"
        case edition, pages
        case apiCoverImage = "image"
        case synopsis, authors
    }
}
