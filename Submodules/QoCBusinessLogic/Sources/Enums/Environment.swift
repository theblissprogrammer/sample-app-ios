//
//  Environment.swift
//  QocBusinessLogic
//
//  Created by Ahmed Saad on 2018-07-25.
//

public enum Environment: String {
    case development
    case staging
    case production
}

public extension Environment {
    
    /// Determine the current environment mode of the build
    static var mode: Environment {
        #if DEBUG
        return .development
        #elseif STAGING
        return .staging
        #else
        return .production
        #endif
    }
}
