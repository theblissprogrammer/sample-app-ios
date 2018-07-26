//
//  DataError.swift
//  QocBusinessLogic
//
//  Created by Ahmed Saad on 2018-07-25.
//
import Foundation

public enum DataError: Error {
    case duplicateFailure
    case nonExistent
    case incomplete
    case unauthorized
    case noInternet
    case timeout
    case parseFailure(Error?)
    case databaseFailure(Error?)
    case cacheFailure(Error?)
    case networkFailure(Error?)
    case unknownReason(Error?)
}

public extension DataError {
    
    init(from error: NetworkError?) {
        // Handle no internet
        if let internalError = error?.internalError as? URLError,
            internalError.code  == .notConnectedToInternet {
            self = .noInternet
            return
        }
        
        // Handle timeout
        if let internalError = error?.internalError as? URLError,
            internalError.code  == .timedOut {
            self = .timeout
            return
        }
        
        // Handle by status code
        switch error?.statusCode {
        case 400?: self = .networkFailure(error)
        case 401?, 403?: self = .unauthorized
        default: self = .unknownReason(error)
        }
    }
}
