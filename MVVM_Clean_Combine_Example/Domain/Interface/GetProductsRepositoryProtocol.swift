//
//  GetProductsRepositoryProtocol.swift
//  MVVM_Clean_Combine_Example
//
//  Created by Macbook-pro on 18/04/23.
//

import Foundation
import Combine

protocol GetProductsRepositoryProtocol {
    
    func getPorducts() -> Future<[Product], NetworkError>
}
