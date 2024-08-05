//
//  File.swift
//  
//
//  Created by Daniel Fourie on 04/08/2024.
//

public protocol BookAPIProtocol {
    
    func getBookList() async throws -> [Book]
    func showBookDetail(isbn10: String, isbn13: String) async throws -> BookDetail
}
