//
//  Bundle.swift
//  QocBusinessLogic
//
//  Created by Ahmed Saad on 2018-07-25.
//
import Foundation

public extension Bundle {
    private class TempClassForBundle {}
    
    /// A representation of the code and resources stored in QocBusinessLogic bundle directory on disk.
    static var qoCBusinessLogic: Bundle {
        return Bundle(for: TempClassForBundle.self)
    }
}
