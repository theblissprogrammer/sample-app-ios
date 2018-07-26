//
//  Constants.swift
//  QocBusinessLogic
//
//  Created by Ahmed Saad on 2018-07-25.
//

public protocol ConstantsType {
    var logFileName: String { get }
}

public struct Constants: ConstantsType {
    public let logFileName = "qocBusinessLogic"
}
