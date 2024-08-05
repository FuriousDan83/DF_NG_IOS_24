//
//  File.swift
//  
//
//  Created by Daniel Fourie on 04/08/2024.
//

import Foundation
import PilotType

public enum BookRoute {
    
    case getBooks(BookListParameters)
    case showBookDetail(BookLDetailParameters)
}

extension BookRoute: Route {
    public var baseURL: URL {
        .init(string: "https://api2.isbndb.com")!
    }
    
    
    public var path: String {
        switch self {
        case let .getBooks(parameters): return "/books/\(parameters.query)"
        case let .showBookDetail(parameters): return "/book/\(parameters.isbn)"
        }
    }
    
    public var httpMethod: HttpMethod { .get }
    
    public var httpHeaders: HttpHeaders {
        [
            "Content-Type": "application/json",
            "Authorization":"${ISBNDB_KEY"
        ]
    }
    
    public var parameters: Parameters? {
        
        switch self {
        case let .getBooks(parameters): return parameters.encoded()
        case let .showBookDetail(parameters): return parameters.encoded()
        }
    }
    
    public var parameterEncoding: ParameterEncoding? {
        switch self {
        case .getBooks, .showBookDetail: return .url
        }
    }
}
