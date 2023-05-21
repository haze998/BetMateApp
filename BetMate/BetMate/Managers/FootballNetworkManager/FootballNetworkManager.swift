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
    
    func test() {
//        var semaphore = DispatchSemaphore (value: 0)       
//        var request = URLRequest(url: URL(string: "https://v3.football.api-sports.io/fixtures?live=all")!, timeoutInterval: Double.infinity)
//        request.addValue("d9e37ef55094492e1e535efcdf70a952", forHTTPHeaderField: "x-rapidapi-key")
//        request.addValue("v3.football.api-sports.io", forHTTPHeaderField: "x-rapidapi-host")
//        request.httpMethod = "GET"
//        debugPrint(request)
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data else {
//                print(String(describing: error))
//                semaphore.signal()
//                return
//            }
//            print(String(data: data, encoding: .utf8)!)
//            semaphore.signal()
//        }
//        
//        task.resume()
//        semaphore.wait()
    }
}
