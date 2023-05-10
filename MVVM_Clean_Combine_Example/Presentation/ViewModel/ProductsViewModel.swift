//
//  ProductsViewModel.swift
//  MVVM_Clean_Combine_Example
//
//  Created by Macbook-pro on 18/04/23.
//

import Foundation
import Combine

protocol ProductsViewControllerDelegate {
    func getProducts() -> Future<[Product], NetworkError>
}

protocol ProductsViewModelDelegate {
    func getProducts() -> Future<[Product], NetworkError>
}

class ProductsViewModel: ProductsViewModelDelegate {
    
    private(set) var getProductsUseCase: GetProductsUseCase!
    
    init(getProductsUseCase: GetProductsUseCase! = GetProductsUseCase()) {
        self.getProductsUseCase = getProductsUseCase
    }
    
    func getProducts() -> Future<[Product], NetworkError> {
        return getProductsUseCase.execute()
    }
}
