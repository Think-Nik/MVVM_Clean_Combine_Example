//
//  ProductModel.swift
//  MVVM_Clean_Combine_Example
//
//  Created by Macbook-pro on 04/04/23.
//

import Foundation

// MARK: - ProductModel
struct ProductModel: Codable {
    let products: [Product]?
    let total, skip, limit: Int?
}

// MARK: - Product
struct Product: Codable {
    let id: Int?
    let title, description: String?
    let price: Int?
    let discountPercentage, rating: Double?
    let stock: Int?
    let brand, category: String?
    let thumbnail: String?
    let images: [String]?
}
