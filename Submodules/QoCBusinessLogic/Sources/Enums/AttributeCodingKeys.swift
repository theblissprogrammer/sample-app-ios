//
//  AttributeCodingKeys.swift
//  QocBusinessLogic iOS
//
//  Created by Ahmed Saad on 2018-07-25.
//

enum AttributeCodingKeys: String, CodingKey {
    case height
    case amount
    case currency
    case term
    case label
    case link = "href"
    case rel
    case id = "im:id"
    case bundleId = "im:bundleId"
    case scheme
}
