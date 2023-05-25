//
//  PokeAPIService.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 16/5/23.
//

import Foundation

class PokeAPIService {
    
    let apiURL = "https://pokeapi.co/api/v2/"
    let mockAPI = "https://6464f6cb228bd07b353e4919.mockapi.io/api/vi/users"
    
    func request<T: Decodable>(endPoint: String, method: HTTPMethod, jsonBody: [String: Any]? = nil, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: apiURL + endPoint) else {
             
            return
        }
        debugPrint(url)
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let jsonBody = jsonBody {
            let jsonData = try? JSONSerialization.data(withJSONObject: jsonBody)
            request.httpBody = jsonData
        }
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                debugPrint(#function, "🔴 Request: \(request)\nError: \(error)")
                completion(.failure(error))
                return
            }
            
            guard let json = data else { return }
            
            do {
                let jsonDecoder = JSONDecoder()
                let decodedJson = try jsonDecoder.decode(T.self, from: json)
                completion(.success(decodedJson))
            } catch let error {
                debugPrint(#function, "🔴 Request: \(request)\nError: \(error)")
                completion(.failure(error))
            }
        }.resume()
    }
    
    func requestLogin<T: Decodable>(endPoint: String, method: HTTPMethod, jsonBody: [String: Any]? = nil, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: mockAPI + endPoint) else {
             
            return
        }
        debugPrint(url)
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let jsonBody = jsonBody {
            let jsonData = try? JSONSerialization.data(withJSONObject: jsonBody)
            request.httpBody = jsonData
        }
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                debugPrint(#function, "🔴 Request: \(request)\nError: \(error)")
                completion(.failure(error))
                return
            }
            
            guard let json = data else { return }
            
            do {
                let jsonDecoder = JSONDecoder()
                let decodedJson = try jsonDecoder.decode(T.self, from: json)
                completion(.success(decodedJson))
            } catch let error {
                debugPrint(#function, "🔴 Request: \(request)\nError: \(error)")
                completion(.failure(error))
            }
        }.resume()
    }
    
}
