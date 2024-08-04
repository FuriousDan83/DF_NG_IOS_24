//
//  File.swift
//  
//
//  Created by Daniel Fourie on 03/08/2024.
//

import Entities

public protocol GetBookListUseCaseProtocol {
    
    func execute() async throws -> [Book]
}
