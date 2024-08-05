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
    
    public func getBooks() async throws -> [Book] {
        return try await bookAPI.getBookList().map { $0 as Book }
    }
    
    public func showBookDetail(isbn: String) async throws -> BookDetail {
        let apiBookDetail = try await bookAPI.showBookDetail(isbn: isbn)
        return apiBookDetail as BookDetail
    }
}
