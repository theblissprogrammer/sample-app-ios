//
//  Thumbnails.swift
//  QocBusinessLogic iOS
//
//  Created by Ahmed Saad on 2018-07-25.
//

public struct Thumbnails: ThumbnailsType, Decodable {
    public var link: String?
    public var height: String?
    
    public init() { }
}

// MARK: - For JSON decoding

extension Thumbnails {
    
    enum CodingKeys: String, CodingKey {
        case link = "label"
        case height
        case attributes
    }
    
    public init(from decoder: Decoder) throws {
        self.init()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.link = try? container.decode(String.self, forKey: .link)
        
        let attributeContainer = try container.nestedContainer(keyedBy: AttributeCodingKeys.self, forKey: .attributes)
        self.height = try? attributeContainer.decode(String.self, forKey: .height)
    }
}
