//
//  FootballNetworkManager.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 20.05.2023.
//

import Foundation

class FootballNtworkManager {
    
    static let shared = FootballNtworkManager()
    
    private init() { }

    // MARK: - Get football info
    func footballNetworkManager(completion: @escaping ([FootballResponse]) -> Void) {
        var url = URLRequest(url: URL(string: "https://v3.football.api-sports.io/fixtures?date=2023-05-22")!, timeoutInterval: Double.infinity)
        url.allHTTPHeaderFields = [
            "x-rapidapi-key" : "d9e37ef55094492e1e535efcdf70a952"
        ]
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let response = try decoder.decode(MainFootball.self, from: data)
                DispatchQueue.main.async {
                    completion(response.response ?? [])
                }
            } catch {
                print(String(describing: error))
            }
        }
        task.resume()
    }
}
