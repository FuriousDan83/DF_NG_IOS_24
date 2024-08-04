//
//  File.swift
//  
//
//  Created by Daniel Fourie on 03/08/2024.
//

import Entities

public protocol ShowBookDetailUseCaseProtocol {
    
    func execute(isbn10: String, isbn13: String) async throws -> BookDetail
}
