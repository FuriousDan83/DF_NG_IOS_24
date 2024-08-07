//
//  File.swift
//  
//
//  Created by Daniel Fourie on 04/08/2024.
//
public protocol BookAPIProtocol {
    
    func getBookList(query: String) async throws -> APIBookResponse
    func showBookDetail(isbn: String) async throws -> APIBookDetail
}
