//
//  File.swift
//  
//
//  Created by Daniel Fourie on 05/08/2024.
//

import Entities
import Foundation

public struct MockBookDetail: BookDetail, Equatable {
    
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
    public let coverImage: CoverImage
    public let synopsis: String
    public let authors: [String]
    
    public static func == (lhs: MockBookDetail, rhs: MockBookDetail) -> Bool {
        return lhs.isbn10 == rhs.isbn10 || lhs.isbn13 == lhs.isbn13
    }
}

public extension MockBookDetail {
    
    static var single = MockBookDetail(
        isbn10: "0575097361",
        isbn13: "0575097361",
        title_short: "The Way of Kings, Part One (Stormlight Archive)",
        title_long: "The Way of Kings, Part One (Stormlight Archive)",
        binding: "Paperback",
        publisher: "Gollancz",
        published_date: "2011",
        edition: "First Thus",
        language: "en",
        pages: 594,
        coverImage: MockImage(image: "https://images.isbndb.com/covers/73/53/9780575097353.jpg"),
        synopsis: "Speak again the ancient oaths. Life before death. Strength before weakness, Journey before destination. And return to men the shards they once bore. The knights radiant must stand again.<br/><br/>Roshar is a world of stone and storms. Uncanny tempests of incredible power sweep across the rocky terrain so frequently that they have shaped ecology and civilization alike. Animals hide in shells, trees pull in branches, and grass retracts into the soilless ground. Cities are built only where the topography offers shelter.<br/><br/>It has been centuries since the fall of the ten consecrated orders known as the Knights Radiant, but their Shardblades and Shardplate remain: mystical swords and suits of armor that transform ordinary men into near-invincible warriors. Men trade kingdoms for Shardblades. Wars are fought for them, and won by them.<br/><br/>One such war is about to swallow up a soldier, a brightlord and a young woman scholar.",
        authors: ["Brandon Sanderson"]
    )
}
