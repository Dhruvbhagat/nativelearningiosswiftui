//
//  ApiService.swift
//  ioslearningapp
//
//  Created by Dhruv on 13/12/2023.
//

import Foundation

protocol ApiServiceProtocol {
    func fetchData(completion: @escaping (Result<[CoworkingSpace], Error>) -> Void)
}

class ApiService: ApiServiceProtocol {
    static let shared = ApiService()
    let apiUrl = "https://localhost:5001/coworkspaces"

    func fetchData(completion: @escaping (Result<[CoworkingSpace], Error>) -> Void) {
        guard let url = URL(string: apiUrl) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                return
            }

            do {
                let items = try JSONDecoder().decode([CoworkingSpace].self, from: data)
                completion(.success(items))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
