//
//  File.swift
//  
//
//  Created by Daniel Fourie on 04/08/2024.
//

import Foundation

public extension String {
    
    var utf8Data: Data { .init(utf8) }
}

public extension Data {
    
    func decoded<T: Decodable>(decoder: JSONDecoder = .apiDecoder) -> T {
        guard let object = try? decoder.decode(T.self, from: self) else {
            fatalError("Unable to decode \(T.self)")
        }
        
        return object
    }
}

extension JSONDecoder {
    
    public static let apiDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

extension JSONEncoder {
    
    public static let apiEncoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }()
}
