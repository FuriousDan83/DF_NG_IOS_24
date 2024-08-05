//
//  File.swift
//  
//
//  Created by Daniel Fourie on 06/08/2024.
//

import Entities
import Foundation
import UseCaseProtocol

public class MockShowBookDetailUseCaseProtocol: ShowBookDetailUseCaseProtocol {
    public func execute(isbn10: String, isbn13: String) async throws -> Entities.BookDetail {
        executeBookDetailCallsCount += 1
        if let error = executeBookDetailThrowableError {
            throw error
        }
        
        if let executeBookDetailClosure = executeBookDetailClosure {
            return try await executeBookDetailClosure()
        } else {
            return executeBookReturnValue
        }
    }
    
    
    public init() {}
    
    public var executeBookDetailThrowableError: (any Error)?
    public var executeBookDetailCallsCount = 0
    public var executeBookDetailCalled: Bool {
        return executeBookDetailCallsCount > 0
    }
    public var executeBookReturnValue: BookDetail!
    public var executeBookDetailClosure: (() async throws -> BookDetail)?
    
}
