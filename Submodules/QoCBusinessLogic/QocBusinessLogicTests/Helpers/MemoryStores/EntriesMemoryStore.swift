//
//  EntriesMemoryStore.swift
//  QoCBusinessLogic iOS
//
//  Created by Ahmed Saad on 2018-07-27.
//

@testable import QocBusinessLogic
import ZamzamKit

public struct EntriesMemoryStore: EntriesStore {
    
}

public extension EntriesMemoryStore {
    func fetch(completion: @escaping (Result<[EntryType], DataError>) -> Void) {
        completion(.success([
            Entry(
                id: 1,
                name: "Test App",
                thumbnails: [Thumbnails()],
                summary: "app",
                price: 0.99,
                currency: "USD",
                contentType: "Application",
                copyright: "Ahmed Saad",
                title: "App Ahmed",
                link: "",
                author: Author(),
                category: Category(),
                releaseDate: Date()
            )        
            ]))
    }
}
