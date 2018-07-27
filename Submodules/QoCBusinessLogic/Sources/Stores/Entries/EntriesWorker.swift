//
//  EntriesWorker.swift
//  QocBusinessLogic iOS
//
//  Created by Ahmed Saad on 2018-07-25.
//

import ZamzamKit

struct EntriesWorker:  EntriesWorkerType {
    private let store: EntriesStore
    private let cacheStore: EntriesCacheStore?
    
    public init(store: EntriesStore, cacheStore: EntriesCacheStore?) {
        self.store = store
        self.cacheStore = cacheStore
    }
}

extension EntriesWorker {
    
    func fetch(completion: @escaping (Result<[EntryType], DataError>) -> Void) {
        // Use cache storage if applicable
        guard let cacheStore = cacheStore else { return store.fetch(completion: completion) }
        
        cacheStore.fetch {
            // Immediately return local response
            completion($0)
            
            guard let cacheElements = $0.value, $0.isSuccess else { return }
            
            // Sync remote updates to cache if applicable
            self.store.fetch {
                // Validate if any updates that needs to be stored
                guard let elements = $0.value, $0.isSuccess else { return }
                
                let taskGroup = DispatchGroup()
                var hasTasks = false
                
                // Remove deleted items
                cacheElements
                    .filter { element in !elements.contains { $0.id == element.id } }
                    .forEach {
                        taskGroup.enter()
                        
                        cacheStore.delete(id: $0.id) {
                            defer { taskGroup.leave() }
                            
                            guard $0.isSuccess else {
                                return
                            }
                            
                            hasTasks = true
                        }
                }
                
                // Add or update modified items
                elements
                    .forEach {
                        taskGroup.enter()
                        
                        cacheStore.createOrUpdate($0) {
                            defer { taskGroup.leave() }
                            
                            guard $0.isSuccess else {
                                return
                            }
                            
                            hasTasks = true
                        }
                }
                
                taskGroup.notify(queue: .main) {
                    // Callback handler again if updated
                    guard hasTasks else { return }
                    
                    completion(.success(elements))
                }
            }
        }
    }
    
    func fetch(id: Int, completion: @escaping (Result<EntryType, DataError>) -> Void) {
        // Use cache storage if applicable
        guard let cacheStore = cacheStore else {
            return store.fetch {
                guard let value = $0.value, let entry = value.first(where: { $0.id == id }), $0.isSuccess else {
                    return completion(.failure($0.error ?? .unknownReason(nil)))
                }
                
                completion(.success(entry))
            }
            
        }
        
        cacheStore.fetch(id: id, completion: completion)
    }
}
