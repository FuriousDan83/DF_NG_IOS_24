//
//  File.swift
//  
//
//  Created by Daniel Fourie on 04/08/2024.
//

import Entities
import Foundation
import NetworkCore
import RepositoryProtocol

public class BookRepository: BookRepositoryProtocol {
        
    private let bookAPI: BookAPIProtocol
    
    public init(bookAPI: BookAPIProtocol) {
        self.bookAPI = bookAPI
    }
    
    public func getBooks(query: String) async throws -> [Book] {
        return try await bookAPI.getBookList(query: query).map { $0 as! any Book }
    }
    
    public func getBookDetail(isbn13: String, isbn10: String) async throws -> BookDetail {
        let apiBookDetail = try await bookAPI.showBookDetail(isbn: isbn13.isEmpty ? isbn10 : isbn13)
        return apiBookDetail as! any BookDetail
    }
}
