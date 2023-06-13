//
//  SportsNetworkManager.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 20.05.2023.
//

import Foundation

class SportsNetworkManager {
    
    static let shared = SportsNetworkManager()
    
    private init() { }

    // MARK: - Get football info
    func getFootballInfo(completion: @escaping ([FootballResponse]) -> Void) {
        var url = URLRequest(url: URL(string: "https://v3.football.api-sports.io/fixtures?date=\(CustomDate.currentDate.rawValue.getCurrentDate())")!, timeoutInterval: Double.infinity)
        url.allHTTPHeaderFields = [
            "x-rapidapi-key" : "\(ApiKeys.sportsApiKey.rawValue)"
        ]

        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data else { return }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let response = try decoder.decode(MainFootball.self, from: data)
                DispatchQueue.main.async {
                    completion(response.response)
                }
            } catch {
                print(String(describing: error))
            }
        }
        task.resume()
    }
    
    // MARK: - Get baseball info
    func getBaseballInfo(completion: @escaping ([BaseballResponse]) -> Void) {
        var url = URLRequest(url: URL(string: "https://v1.baseball.api-sports.io/games?date=\(CustomDate.currentDate.rawValue.getCurrentDate())")!)
        url.allHTTPHeaderFields = [
            "x-rapidapi-key" : "\(ApiKeys.sportsApiKey.rawValue)"
        ]

        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data else { return }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let response = try decoder.decode(MainBaseball.self, from: data)
                DispatchQueue.main.async {
                    completion(response.response ?? [])
                }
            } catch {
                print(String(describing: error))
            }
        }
        task.resume()
    }
    
    // MARK: - Get basketball info
    func getBasketballInfo(completion: @escaping ([BasketballResponse]) -> Void) {
//        var url = URLRequest(url: URL(string: "https://v1.basketball.api-sports.io/games?date=\(CustomDate.currentDate.rawValue.getCurrentDate())")!)
//        url.allHTTPHeaderFields = [
//            "x-rapidapi-key" : "\(ApiKeys.sportsApiKey.rawValue)"
//        ]
//
//        let session = URLSession(configuration: .default)
//        let task = session.dataTask(with: url) { data, response, error in
//            guard let data = data else { return }
//            do {
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                let response = try decoder.decode(MainBasketball.self, from: data)
//                DispatchQueue.main.async {
//                    completion(response.response ?? [])
//                }
//            } catch {
//                print(String(describing: error))
//            }
//        }
//        task.resume()
    }
    
    
    // MARK: - Get hockey info
    func getHockeyInfo(completion: @escaping ([HockeyResponse]) -> Void) {
//        var url = URLRequest(url: URL(string: "https://v1.hockey.api-sports.io/games?date=\(CustomDate.currentDate.rawValue.getCurrentDate())")!)
//        url.allHTTPHeaderFields = [
//            "x-rapidapi-key" : "\(ApiKeys.sportsApiKey.rawValue)"
//        ]
//
//        let session = URLSession(configuration: .default)
//        let task = session.dataTask(with: url) { data, response, error in
//            guard let data = data else { return }
//            do {
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                let response = try decoder.decode(MainHockey.self, from: data)
//                DispatchQueue.main.async {
//                    completion(response.response ?? [])
//                }
//            } catch {
//                print(String(describing: error))
//            }
//        }
//        task.resume()
    }
    
    // MARK: - Get volleyball info
    func getVolleyballInfo(completion: @escaping ([VolleyballResponse]) -> Void) {
//        var url = URLRequest(url: URL(string: "https://v1.volleyball.api-sports.io/games?date=\(CustomDate.currentDate.rawValue.getCurrentDate())")!)
//        url.allHTTPHeaderFields = [
//            "x-rapidapi-key" : "\(ApiKeys.sportsApiKey.rawValue)"
//        ]
//
//        let session = URLSession(configuration: .default)
//        let task = session.dataTask(with: url) { data, response, error in
//            guard let data = data else { return }
//            do {
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                let response = try decoder.decode(MainVolleyball.self, from: data)
//                DispatchQueue.main.async {
//                    completion(response.response ?? [])
//                }
//            } catch {
//                print(String(describing: error))
//            }
//        }
//        task.resume()
    }
    
    // MARK: - Get handball info
    func getHandballInfo(completion: @escaping ([HandballResponse]) -> Void) {
//        var url = URLRequest(url: URL(string: "https://v1.handball.api-sports.io/games?date=\(CustomDate.currentDate.rawValue.getCurrentDate())")!)
//        url.allHTTPHeaderFields = [
//            "x-rapidapi-key" : "\(ApiKeys.sportsApiKey.rawValue)"
//        ]
//
//        let session = URLSession(configuration: .default)
//        let task = session.dataTask(with: url) { data, response, error in
//            guard let data = data else { return }
//            do {
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                let response = try decoder.decode(MainHandball.self, from: data)
//                DispatchQueue.main.async {
//                    completion(response.response ?? [])
//                }
//            } catch {
//                print(String(describing: error))
//            }
//        }
//        task.resume()
    }
}
