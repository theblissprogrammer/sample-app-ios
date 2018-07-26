//
//  DateFormatter.swift
//  QocBusinessLogic
//
//  Created by Ahmed Saad on 2018-07-25.
//

import Foundation

extension DateFormatter {
    
    static var iso8601: DateFormatter = {
        DateFormatter().with {
            $0.locale = .posix
            $0.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        }
    }()
}
