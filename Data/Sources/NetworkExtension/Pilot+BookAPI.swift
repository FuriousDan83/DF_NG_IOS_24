//
//  File.swift
//  
//
//  Created by Daniel Fourie on 04/08/2024.
//

import NetworkCore
import Pilot

extension Pilot: BookAPIProtocol where R == BookRoute {    
    public func getBookList(query: String) async throws -> [APIBook] {
        return try await request(
            .getBooks(BookListParameters(perPage: 10, page: 1, query: query)),
            target: [APIBook].self,
            decoder: .apiDecoder
        )
    }
    
    public func showBookDetail(isbn: String) async throws -> APIBookDetail {
        return try await request(
            .showBookDetail(BookLDetailParameters(isbn: isbn)),
            target: APIBookDetail.self,
            decoder: .apiDecoder
        )
    }
}

