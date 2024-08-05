//
//  File.swift
//  
//
//  Created by Daniel Fourie on 03/08/2024.
//

import Entities
import RepositoryProtocol
import UseCaseProtocol

public class GetBookListUseCase: GetBookListUseCaseProtocol {
    
    private let repository: BookRepositoryProtocol
    
    public init(repository: BookRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute(query: String) async throws -> [Book] {
        return try await repository.getBooks(query: query)
    }
}
