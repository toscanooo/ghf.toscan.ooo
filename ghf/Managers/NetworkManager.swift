//
//  NetworkManager.swift
//  ghf
//
//  Created by Marcelo Toscano Rodrigues on 09/03/21.
//

import Foundation


class NetworkManager {
    static let shared = NetworkManager()
    let baseURL = "https://api.github.com/users/"
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completed: @escaping ([Follower]?, ErrorMessage?) -> Void ){
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        print(endpoint)
        guard let url = URL(string: endpoint) else {
            completed(nil, .invalidURL )
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(nil, .InvalidConection)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, .invalidResponse)
                return
            }
            
            guard let data = data else {
                completed(nil,.invalidData)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers,nil)
            } catch {
                print(error.localizedDescription)
                completed(nil,.invalidData)
            }
        }
        
        task.resume()
    }
}
