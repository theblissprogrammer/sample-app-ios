//
//  AuthorsStoreInterfaces.swift
//  QocBusinessLogic
//
//  Created by Ahmed Saad on 2018-07-25.
//

import ZamzamKit

public protocol AuthorsStore {
    func fetch(name: String, completion: @escaping (Result<AuthorType, DataError>) -> Void)
}

public protocol AuthorsWorkerType: AuthorsStore {

}
