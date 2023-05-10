//
//  NetworkError.swift
//  MVVM_Clean_Combine_Example
//
//  Created by Macbook-pro on 04/04/23.
//

import Foundation

enum NetworkError: LocalizedError, Equatable {
    case invalidRequest
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case error4xx(_ code: Int)
    case serverError
    case error5xx(_ code: Int)
    case decodingError
    case urlSessionFailed(_ error: URLError)
    case unknownError
}
