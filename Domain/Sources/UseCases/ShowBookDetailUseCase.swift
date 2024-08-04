//
//  File.swift
//  
//
//  Created by Daniel Fourie on 03/08/2024.
//

import Entities
import RepositoryProtocol
import UseCaseProtocol

public class ShowBookDetailUseCase: ShowBookDetailUseCaseProtocol {
    
    private let repository: BookRepositoryProtocol
    
    public init(repository: BookRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute(isbn10: String, isbn13: String) async throws -> BookDetail {
        return try await repository.getBookDetail(isbn13: isbn10, isbn10: isbn13)
    }
}
