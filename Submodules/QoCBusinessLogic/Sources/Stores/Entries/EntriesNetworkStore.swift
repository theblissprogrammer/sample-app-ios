//
//  EntriesNetworkStore.swift
//  QocBusinessLogic iOS
//
//  Created by Ahmed Saad on 2018-07-25.
//

import ZamzamKit

public struct EntriesNetworkStore: EntriesStore {
    private let httpService: HTTPServiceType
    
    public init(httpService: HTTPServiceType) {
        self.httpService = httpService
    }
}

public extension EntriesNetworkStore {
    
    func fetch(completion: @escaping (Result<[EntryType], DataError>) -> Void) {
        httpService.get(
            urlString: "http://phobos.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/limit=100/json",
            completion: {
                // Handle errors if applicable
                guard let value = $0.value, $0.isSuccess else {
                    let error = DataError(from: $0.error)
                
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                    return
                }
                
                do {
                    // Parse response data
                    let payload = try JSONDecoder.default.decode(FeedWrapper.self, from: value.data).feed.entries
                    
                    DispatchQueue.main.async {
                        completion(.success(payload))
                    }
                } catch {
                    DispatchQueue.main.async {
                        return completion(.failure(.parseFailure(error)))
                    }
                }
            }
        )
    }
}
