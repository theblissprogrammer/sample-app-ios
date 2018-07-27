//
//  Dependency.swift
//  QocBusinessLogic
//
//  Created by Ahmed Saad on 2018-07-25.
//

open class Dependency: Dependable {
    public init() { }
    
    open func resolve() -> ConstantsType {
        return Constants()
    }
    
    // MARK: - Workers

    open func resolveWorker() -> EntriesWorkerType {
        return EntriesWorker(store: resolveStore(), cacheStore: nil)
    }
    
    // MARK: - Store
    
    open func resolveStore() -> EntriesStore {
        return EntriesNetworkStore(httpService: resolveService())
    }
    
    // MARK: - Service
    
    open func resolveService() -> HTTPServiceType {
        return HTTPService()
    }
}
