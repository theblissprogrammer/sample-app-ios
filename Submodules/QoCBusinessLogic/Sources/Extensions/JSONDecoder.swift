//
//  JSONDecoder.swift
//  QocBusinessLogic
//
//  Created by Ahmed Saad on 2018-07-25.
//

import ZamzamKit

// MARK: - Handle date parsing strategy

extension JSONDecoder: With {
    public static let `default`: JSONDecoder = {
        JSONDecoder().with {
            $0.dateDecodingStrategy = .formatted(DateFormatter.iso8601)
        }
    }()
}

public extension JSONDecoder {
    
    /// Returns a value of the type you specify, decoded from a JSON object.
    func decode<T>(_ type: T.Type, forResource name: String?, inBundle bundle: Bundle) throws -> T where T: Decodable {
        guard let url = bundle.url(forResource: name, withExtension: nil) else { throw DataError.databaseFailure(nil) }
        
        do {
            let data = try Data(contentsOf: url, options: .mappedIfSafe)
            return try decode(type, from: data)
        } catch {
            throw DataError.parseFailure(error)
        }
    }
}
