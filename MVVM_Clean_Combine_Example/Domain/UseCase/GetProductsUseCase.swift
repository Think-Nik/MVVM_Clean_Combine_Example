//
//  GetProductsUseCase.swift
//  MVVM_Clean_Combine_Example
//
//  Created by Macbook-pro on 18/04/23.
//

import Foundation
import Combine

protocol GetProductsUseCaseProtocol {
    func execute() -> Future<[Product], NetworkError>
}

class GetProductsUseCase: GetProductsUseCaseProtocol {
    
    private(set) var getProductRepository: GetProductsRepositoryProtocol!
    
    init(getProductRepository: GetProductsRepository! = GetProductsRepository()) {
        self.getProductRepository = getProductRepository
    }
    
    func execute() -> Future<[Product], NetworkError> {
        return getProductRepository.getPorducts()
    }
}
