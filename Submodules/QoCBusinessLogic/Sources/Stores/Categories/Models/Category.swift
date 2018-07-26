//
//  Category.swift
//  QocBusinessLogic
//
//  Created by Ahmed Saad on 2018-07-25.
//

public struct Category: CategoryType, Decodable {
    public var id: String = ""
    public var name: String = ""
    public var link: String = ""
    
    public init() { }
}

// MARK: - For JSON decoding

extension Category {
    
    enum CodingKeys: String, CodingKey {
        case id = "im:id"
        case name = "label"
        case link = "scheme"
    }
}

