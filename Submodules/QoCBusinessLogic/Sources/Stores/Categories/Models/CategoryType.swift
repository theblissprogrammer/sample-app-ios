//
//  CategoryType.swift
//  QocBusinessLogic
//
//  Created by Ahmed Saad on 2018-07-25.
//

public protocol CategoryType {
    var id: String { get set }
    var name: String { get set }
    var link: String { get set }
    
    init()
}

// MARK: - For converting to one type to another
extension CategoryType {
    
    init(from object: CategoryType) {
        self.init()
        self.id = object.id
        self.name = object.name
        self.link = object.link
    }
    
    init?(from object: CategoryType?) {
        guard let object = object else { return nil }
        self.init(from: object)
    }
}
