//
//  Entry.swift
//  QocBusinessLogic iOS
//
//  Created by Ahmed Saad on 2018-07-25.
//

import ZamzamKit

public struct Entry: EntryType, Decodable {
    public var id: Int = 0
    public var name: String = ""
    public var thumbnails: [Thumbnails] = []
    public var summary: String = ""
    public var price: Double = 0.0
    public var currency: String = ""
    public var contentType: String = ""
    public var copyright: String = ""
    public var title: String = ""
    public var link: String = ""
    public var author: Author?
    public var category: Category?
    public var releaseDate: Date = .distantPast
    
    public init() { }
}

// MARK: - For JSON decoding

extension Entry {
    enum CodingKeys: String, CodingKey {
        case id
        case name = "im:name"
        case thumbnails = "im:image"
        case summary
        case price =  "im:price"
        case currency
        case contentType = "im:contentType"
        case copyright = "rights"
        case title
        case link
        case author = "im:artist"
        case category
        case releaseDate = "im:releaseDate"
    }
    
    public init(from decoder: Decoder) throws {
        self.init()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let idContainter = try container.nestedContainer(keyedBy: SubCodingKeys.self, forKey: .id).nestedContainer(keyedBy: AttributeCodingKeys.self, forKey: .attributes)
        self.id = try Int(idContainter.decode(String.self, forKey: .id)) ?? 0
        
        let nameContainter = try container.nestedContainer(keyedBy: SubCodingKeys.self, forKey: .name)
        self.name = try nameContainter.decode(String.self, forKey: .label)
        
        self.thumbnails = try container.decode(FailableCodableArray<Thumbnails>.self, forKey: .thumbnails).elements
        
        let summaryContainter = try container.nestedContainer(keyedBy: SubCodingKeys.self, forKey: .summary)
        self.summary = try summaryContainter.decode(String.self, forKey: .label)
        
        let priceContainter = try container.nestedContainer(keyedBy: SubCodingKeys.self, forKey: .price).nestedContainer(keyedBy: AttributeCodingKeys.self, forKey: .attributes)
        
        self.price = try Double(priceContainter.decode(String.self, forKey: .amount)) ?? 0.0
        self.currency = try priceContainter.decode(String.self, forKey: .currency)
        
        let contentTypeContainter = try container.nestedContainer(keyedBy: SubCodingKeys.self, forKey: .contentType).nestedContainer(keyedBy: AttributeCodingKeys.self, forKey: .attributes)
        self.contentType = try contentTypeContainter.decode(String.self, forKey: .label)
        
        let rightsTypeContainter = try container.nestedContainer(keyedBy: SubCodingKeys.self, forKey: .copyright)
        self.copyright = try rightsTypeContainter.decode(String.self, forKey: .label)
        
        let titleTypeContainter = try container.nestedContainer(keyedBy: SubCodingKeys.self, forKey: .title)
        self.title = try titleTypeContainter.decode(String.self, forKey: .label)
        
        let linkTypeContainter = try container.nestedContainer(keyedBy: SubCodingKeys.self, forKey: .link).nestedContainer(keyedBy: AttributeCodingKeys.self, forKey: .attributes)
        self.link = try linkTypeContainter.decode(String.self, forKey: .link)
        
        self.author = try container.decodeIfPresent(Author.self, forKey: .author)
        
        let categoryContainter = try container.nestedContainer(keyedBy: SubCodingKeys.self, forKey: .category)
        self.category = try categoryContainter.decodeIfPresent(Category.self, forKey: .attributes)
        
        let releaseDateContainter = try container.nestedContainer(keyedBy: SubCodingKeys.self, forKey: .releaseDate)
        self.releaseDate = try releaseDateContainter.decode(Date.self, forKey: .label)
    }
}

struct FeedWrapper: Decodable {
    let feed: Feed
    
    enum CodingKeys: String, CodingKey {
        case feed
    }
}

struct Feed: Decodable {
    let entries: [Entry]
    
    enum CodingKeys: String, CodingKey {
        case entries = "entry"
    }
}
