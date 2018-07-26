//
//  ThumbnailsType.swift
//  QocBusinessLogic iOS
//
//  Created by Ahmed Saad on 2018-07-25.
//

public protocol ThumbnailsType {
    var link: String? { get set }
    var height: String? { get set }
    
    init()
}

// MARK: - For converting to one type to another
extension ThumbnailsType {
    
    init(from object: ThumbnailsType) {
        self.init()
        self.link = object.link
        self.height = object.height
    }
    
    init?(from object: ThumbnailsType?) {
        guard let object = object else { return nil }
        self.init(from: object)
    }
}
