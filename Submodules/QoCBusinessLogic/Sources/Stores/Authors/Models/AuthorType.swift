//
//  UserType.swift
//  SwiftPress
//
//  Created by Ahmed Saad on 2018-07-25.
//

public protocol AuthorType {
    var name: String { get set }
    var link: String { get set }
    
    init()
}

// MARK: - For converting to one type to another
extension AuthorType {
    
    init(from object: AuthorType) {
        self.init()
        self.name = object.name
        self.link = object.link
    }
    
    init?(from object: AuthorType?) {
        guard let object = object else { return nil }
        self.init(from: object)
    }
}
