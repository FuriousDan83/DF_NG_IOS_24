//
//  File.swift
//  
//
//  Created by Daniel Fourie on 03/08/2024.
//

import Entities

public protocol BookRepositoryProtocol {
    
    func getBooks() async throws -> [Book]
    func getBookDetail(isbn13: String, isbn10: String) async throws -> BookDetail
}
