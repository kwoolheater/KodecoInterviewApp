//
//  Networking.swift
//  RayWenderlichApp
//
//  Created by Woolheater, Kiyoshi on 8/18/23.
//

import Foundation

struct Networking {
    func fetchData<T: Decodable>(urlString: String, completion: @escaping(Result<T, NetworkingError>)-> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.badUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completion(.failure(.networkError))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.statusCode))
                return
            }
            
            if let data = data {
                do {
                    let object = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(object))
                } catch (let error) {
                    completion(.failure(.decodingError))
                }
            }
        }.resume()
    }
}

enum NetworkingError: Error {
    case badUrl
    case statusCode
    case networkError
    case decodingError
}
