//
//  GetProductsRepository.swift
//  MVVM_Clean_Combine_Example
//
//  Created by Macbook-pro on 18/04/23.
//

import Foundation
import Combine

class GetProductsRepository: GetProductsRepositoryProtocol {
    
    private(set) var networkClient: NetworkClient!
    private var cancellables: [AnyCancellable] = []
    
    init(networkClient: NetworkClient! = NetworkClient()) {
        self.networkClient = networkClient
    }
    
    func getPorducts() -> Future<[Product], NetworkError> {
        return Future { [weak self] promise in
            guard let strongSelf = self else {
                return
            }
            strongSelf.networkClient.request(request: GetProducts())
                .sink { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        promise(Result.failure(error))
                    }
                } receiveValue: { product in
                    promise(Result.success(product.products ?? []))
                }
                .store(in: &strongSelf.cancellables)
        }
    }
}

struct GetProducts: NetworkConfig {
    
    typealias ReturnType = ProductModel
    var path: String = "products"
}
