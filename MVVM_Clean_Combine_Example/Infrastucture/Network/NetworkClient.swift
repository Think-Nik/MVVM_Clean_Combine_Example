//
//  NetworkClient.swift
//  MVVM_Clean_Combine_Example
//
//  Created by Macbook-pro on 04/04/23.
//

import Foundation
import Combine

final class NetworkClient {
    
    private(set) var baseURL: String!
    private(set) var networkService: NetworkService!
    
    init(baseURL: String = "https://dummyjson.com/",
         networkService: NetworkService = NetworkService()) {
        self.baseURL = baseURL
        self.networkService = networkService
    }
    
    func request<R: NetworkConfig>(request: R) -> AnyPublisher<R.ReturnType, NetworkError> {
        guard let urlRequest = request.asURLRequest(baseURL: baseURL) else {
            return Fail(outputType: R.ReturnType.self, failure: NetworkError.badRequest).eraseToAnyPublisher()
            
        }
        typealias RequestPublisher = AnyPublisher<R.ReturnType, NetworkError>
        let requestPublisher: RequestPublisher = networkService.request(request: urlRequest)
        return requestPublisher.eraseToAnyPublisher()
    }
}
