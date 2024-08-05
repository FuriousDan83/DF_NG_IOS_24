//
//  File.swift
//  
//
//  Created by Daniel Fourie on 04/08/2024.
//

import NetworkCore
import Pilot

extension Pilot: BookAPIProtocol where R == BookRoute {
    
    public func getBooks() asyns throws -> [Books] {
        return try await request(
            .getBooks(BookListParameters(perPage: 10, page: 1)),
            target: [APIBook].self,
            decoder: .apiDecoder
        )
    }
    
    public func showBookDetail(isbn: String) async throws -> APIBookDetail {
        return try await request(
            .showBookDetail(BookDetailParameters(isbn: isbn)),
            target: APIBookDetail.self,
            decoder: .apiDecoder
        )
    }
}

extension APIBookDetail: BookDetail {
    public var image: Image { coverImage }
}

extension CoverImage: Image {}
