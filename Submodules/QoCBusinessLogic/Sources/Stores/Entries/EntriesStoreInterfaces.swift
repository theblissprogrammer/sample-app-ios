//
//  EntriesStoreInterfaces.swift
//  QocBusinessLogic iOS
//
//  Created by Ahmed Saad on 2018-07-25.
//

import ZamzamKit

public protocol EntriesStore {
    func fetch(completion: @escaping (Result<[EntryType], DataError>) -> Void)
}

public protocol EntriesCacheStore: EntriesStore {
    func fetch(id: Int, completion: @escaping (Result<EntryType, DataError>) -> Void)
    
    func createOrUpdate(_ request: EntryType, completion: @escaping (Result<EntryType, DataError>) -> Void)
    func delete(id: Int, completion: @escaping (Result<Void, DataError>) -> Void)
}

public protocol EntriesWorkerType: EntriesStore {
    func fetch(id: Int, completion: @escaping (Result<EntryType, DataError>) -> Void)
}
