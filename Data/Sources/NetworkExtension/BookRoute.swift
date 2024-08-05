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
    case showBookDetail(BookDetailParameters)
}

extension BookRoute: Route {
    
    public var baseUrl: URL {
        .init(string: "https://api2.isbndb.com")!
    }
    
    public var path: String {
        switch self {
        case .getBooks(parameters): return "/books/\(parameters.query)"
        case .showBookDetail(parameters): return "/book/\(parameters.isbn)"
        }
    }
    
    public var httpMethod: HttpMethod { .get }
    
    public var httpHeaders: HttpHeaders {
        [
            ("Content-Type": "application/json"),
            ("Authorization":"${ISBNDB_KEY")
        ]
    }
    
    public var parameters: Parameters? {
        
        switch self {
        case let .getBooks(parameters): return parameters.encoded()
        case let .showBookDetail(parameters): return parameters.encoded()
        default: nil
        }
    }
    
    public var parameterEncoding: ParameterEncoding? {
        switch self {
        case .getBooks, .showBookDetail: return .url
        default: return nil
        }
    }
}
