//
//  NativeNetworError.swift
//  ViperDesignPattern
//
//  Created by sherif on 16/12/2024.
//

import Foundation


enum NativeNetworkError: Error {
    
    case invalidURL
    case requestFailed(Error)
    case invalidHttpResponse
    case invalidData
    case success
    case decodingError
    case unauthorized
    case noRefreshToken
    case noAccessToken
    case unknownErrors

    
    var localizedDescription: String{
        switch self {
        case .invalidURL:
            return "Invalid URL."
        case .requestFailed(_):
            return "Invalid Request."
        case .invalidHttpResponse :
            return "Invalid response received."
        case .invalidData:
            return "Invalid Data received"
        case .success:
            return "Success Data received."
        case .decodingError:
            return "Error in Decoding Data."
        case .unauthorized:
            return "Not authorized"
        case .noRefreshToken:
            return "No refersh Token Found"
        case .noAccessToken:
            return "No Access Token Refreshed"
        case .unknownErrors:
            return "Unknown error Plesae check internet connection"
        }
    }
}
