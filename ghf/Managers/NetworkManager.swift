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
    
    func getFollowers(for username: String, page: Int, completed: @escaping ([Follower]?, String?) -> Void ){
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        print(endpoint)
        guard let url = URL(string: endpoint) else {
            completed(nil, "URL invalida, por favor tente novamente." )
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(nil, "Não foi possivel completar sua solicitação, verifique sua conexão!")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, "Resposta inválida do servidor, tente novamente!")
                return
            }
            
            guard let data = data else {
                completed(nil,"Dados recebidos do servidor são inválidos!")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers,nil)
            } catch {
                completed(nil,"Ocorreu um problema com Decoder")
            }
        }
        
        task.resume()
    }
}
