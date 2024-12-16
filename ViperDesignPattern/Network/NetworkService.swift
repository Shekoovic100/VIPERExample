//
//  NetworkService.swift
//  ViperDesignPattern
//
//  Created by sherif on 15/12/2024.
//

import Foundation


protocol NativeNetworkManagerServiceProtocol {
    
    func request<T: Codable>(urlString: String, method: NetworkService.HTTPMethod, parameters: [String: Any]? ,tokenRetrived: String?,completion:  @escaping (T?,Error?) -> Void)
}

class NetworkService: NativeNetworkManagerServiceProtocol {

    static let shared = NetworkService()
    static var showIndicator: Bool = true
    private let session = URLSession.shared

    
    public enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"

    }
    
    //MARK: functions Request
    func request<T: Codable>(urlString: String, method: HTTPMethod, parameters: [String: Any]? = nil,tokenRetrived: String? = nil ,completion: @escaping (T?,Error?) -> Void) {
        print("endPoint Url>>> \(urlString)")
        
        
        guard let url = URL(string: urlString) else {
            completion(nil,NativeNetworkError.invalidURL)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.timeoutInterval = 30.0
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if let tokenRetrived = tokenRetrived{
            request.setValue("Bearer \(tokenRetrived)", forHTTPHeaderField: "Authorization")
        }
        
        if let paramters = parameters {
            guard let httpBody = try? JSONSerialization.data(withJSONObject: paramters, options: []) else {
                return
            }
            request.httpBody = httpBody
        }
        
        
        let task = session.dataTask(with: request) { data, response, error in
            
            if let error = error {
                completion(nil, error)
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, error)
                return
            }
          
            guard let data = data else {
                completion(nil, NativeNetworkError.invalidData)
                return
            }
            if (200 ..< 300).contains(httpResponse.statusCode) {
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(T.self, from: data)
                    completion(result, error)
                }catch {
                    completion(nil,NativeNetworkError.invalidData)
                }
            }
        }
        task.resume()
    }
}
