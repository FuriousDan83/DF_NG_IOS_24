//
//  File.swift
//  
//
//  Created by Daniel Fourie on 03/08/2024.
//

import Entities

// sourcery: AutoMockable
public protocol GetBookListUseCaseProtocol {
    
    func execute(query: String) async throws -> [Book]
}
