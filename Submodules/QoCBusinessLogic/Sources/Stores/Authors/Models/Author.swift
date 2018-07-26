//
//  Author.swift
//  QocBusinessLogic
//
//  Created by Ahmed Saad on 2018-07-25.
//

public struct Author: AuthorType, Decodable {
    public var name: String = ""
    public var link: String = ""
    
    public init() { }
}

// MARK: - For JSON decoding

extension Author {
    
    enum CodingKeys: String, CodingKey {
        case name = "label"
        case link
        case attributes
    }
    
    public init(from decoder: Decoder) throws {
        self.init()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        
        let attributesContainer = try container.nestedContainer(keyedBy: AttributeCodingKeys.self, forKey: .attributes)
        self.link = try attributesContainer.decode(String.self, forKey: .link)
    }
}
