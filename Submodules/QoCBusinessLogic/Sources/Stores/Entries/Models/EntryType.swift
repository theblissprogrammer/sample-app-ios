//
//  EntryType.swift
//  QocBusinessLogic iOS
//
//  Created by Ahmed Saad on 2018-07-25.
//
import Foundation

public protocol EntryType {
    var id: Int { get set }
    var name: String { get set }
    var thumbnails: [Thumbnails] { get set }
    var summary: String { get set }
    var price: Double { get set }
    var currency: String { get set }
    var contentType: String { get set }
    var copyright: String { get set }
    var title: String { get set }
    var link: String { get set }
    var author: Author? { get set }
    var category: Category? { get set }
    var releaseDate: Date { get set }
    
    init ()
}

// MARK: - For converting to one type to another
extension EntryType {
    
    init(from object: EntryType) {
        self.init()
        self.id = object.id
        self.name = object.name
        self.thumbnails = object.thumbnails
        self.summary = object.summary
        self.price = object.price
        self.currency = object.currency
        self.contentType = object.contentType
        self.copyright = object.copyright
        self.title = object.title
        self.link = object.link
        self.author = object.author
        self.category = object.category
        self.releaseDate = object.releaseDate
    }
    
    init?(from object: EntryType?) {
        guard let object = object else { return nil }
        self.init(from: object)
    }
}
