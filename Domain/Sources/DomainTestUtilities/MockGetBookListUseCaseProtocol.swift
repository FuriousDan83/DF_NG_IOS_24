//
//  File.swift
//  
//
//  Created by Daniel Fourie on 05/08/2024.
//

import Entities
import Foundation
import UseCaseProtocol

public class MockGetBookListUseCaseProtocol: GetBookListUseCaseProtocol {

    public init() {}



    //MARK: - execute

    public var executeBookThrowableError: (any Error)?
    public var executeBookCallsCount = 0
    public var executeBookCalled: Bool {
        return executeBookCallsCount > 0
    }
    public var executeBookReturnValue: [Book]!
    public var executeBookClosure: (() async throws -> [Book])?

    public func execute(query: String) async throws -> [Book] {
        executeBookCallsCount += 1
        if let error = executeBookThrowableError {
            throw error
        }
        if let executeBookClosure = executeBookClosure {
            return try await executeBookClosure()
        } else {
            return executeBookReturnValue
        }
    }


}
