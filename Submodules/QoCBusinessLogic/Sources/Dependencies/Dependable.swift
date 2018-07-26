//
//  Dependable.swift
//  QocBusinessLogic
//
//  Created by Ahmed Saad on 2018-07-25.
//

public protocol Dependable {
    func resolve() -> ConstantsType
    
    func resolveWorker() -> EntriesWorkerType
    
    func resolveStore() -> EntriesStore
    
    func resolveService() -> HTTPServiceType
}
