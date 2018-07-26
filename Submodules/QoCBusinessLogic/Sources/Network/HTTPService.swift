//
//  HTTPService.swift
//  QocBusinessLogic
//
//  Created by Ahmed Saad on 2018-07-25.
//

import ZamzamKit

public typealias ServerResponse = (data: Data, headers: [String: String], statusCode: Int)

public protocol HTTPServiceType {
    func get(urlString: String, parameters: [String: String]?, headers: [String: String]?, completion: @escaping (ZamzamKit.Result<ServerResponse, NetworkError>) -> Void)
    
    func get(urlString: String, completion: @escaping (ZamzamKit.Result<ServerResponse, NetworkError>) -> Void)
}

public struct HTTPService: HTTPServiceType {
    
    init() {
    }
}

public extension HTTPService {
    
    func get(urlString: String, completion: @escaping (Result<ServerResponse, NetworkError>) -> Void) {
        self.get(urlString: urlString, parameters: nil, headers: nil, completion: completion)
    }
    
    func get(urlString: String, parameters: [String: String]? = nil, headers: [String: String]? = nil, completion: @escaping (ZamzamKit.Result<ServerResponse, NetworkError>) -> Void) {
        
        var components = URLComponents(string: urlString)
        components?.queryItems = parameters?.map { URLQueryItem(name: $0, value: $1) }
        
        guard let url = components?.url else { return }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            let response = response as? HTTPURLResponse
            
            let statusCode = response?.statusCode ?? 0
            let headers: [String: String] = {
                guard let allHeaderFields = $0 else { return [:] }
                return Dictionary(uniqueKeysWithValues: allHeaderFields.map {("\($0)", "\($1)")})
            }(response?.allHeaderFields)
            
            // Handle errors
            guard let value = data, statusCode >= 200, statusCode <= 299 , error == nil else {
                debugPrint("Network Error: \(error?.localizedDescription ?? "")")
                
                let error = NetworkError(
                    urlRequest: URLRequest(url: url),
                    statusCode: response?.statusCode ?? 404,
                    headerValues: headers,
                    serverData: data,
                    internalError: error
                )
                
                return completion(.failure(error))
            }
            
            completion(.success((value, headers, statusCode)))
        })
        
        task.resume()
    }
}
