//
//  File.swift
//  
//
//  Created by Daniel Fourie on 04/08/2024.
//

public protocol BookAPIProtocol {
    
    func getBookList() async throws -> [Book]
    func showBookDetail(isbn: String) async throws -> BookDetail
}
