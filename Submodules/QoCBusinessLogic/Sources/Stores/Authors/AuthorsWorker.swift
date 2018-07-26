//
//  AuthorsStoreInterfaces.swift
//  SwiftPress
//
//  Created by Ahmed Saad on 2018-07-25.
//

import ZamzamKit

public struct AuthorsWorker: AuthorsWorkerType {
    private let store: AuthorsStore
    
    public init(store: AuthorsStore) {
        self.store = store
    }
}

public extension AuthorsWorker {
    
    func fetch(name: String, completion: @escaping (Result<AuthorType, DataError>) -> Void) {
        store.fetch(name: name, completion: completion)
    }
}
