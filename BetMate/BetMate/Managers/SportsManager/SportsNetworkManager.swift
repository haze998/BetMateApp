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
//        var url = URLRequest(url: URL(string: "https://v3.football.api-sports.io/fixtures?date=\(CustomDate.currentDate.rawValue.getCurrentDate())")!, timeoutInterval: Double.infinity)
//        url.allHTTPHeaderFields = [
//            "x-rapidapi-key" : "\(ApiKeys.sportsApiKey.rawValue)"
//        ]
//
//        let session = URLSession(configuration: .default)
//        let task = session.dataTask(with: url) { data, response, error in
//            guard let data = data else { return }
//
//            do {
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                let response = try decoder.decode(MainFootball.self, from: data)
//                DispatchQueue.main.async {
//                    completion(response.response)
//                }
//            } catch {
//                print(String(describing: error))
//            }
//        }
//        task.resume()
    }
    
    // MARK: - Get baseball info
    func getBaseballInfo(completion: @escaping ([BaseballResponse]) -> Void) {
//                var url = URLRequest(url: URL(string: "https://v1.baseball.api-sports.io/games?date=\(CustomDate.currentDate.rawValue.getCurrentDate())")!)
//                url.allHTTPHeaderFields = [
//                    "x-rapidapi-key" : "\(ApiKeys.sportsApiKey.rawValue)"
//                ]
//
//                let session = URLSession(configuration: .default)
//                let task = session.dataTask(with: url) { data, response, error in
//                    guard let data = data else { return }
//
//                    do {
//                        let decoder = JSONDecoder()
//                        decoder.keyDecodingStrategy = .convertFromSnakeCase
//                        let response = try decoder.decode(MainBaseball.self, from: data)
//                        DispatchQueue.main.async {
//                            completion(response.response ?? [])
//                        }
//                    } catch {
//                        print(String(describing: error))
//                    }
//                }
//                task.resume()
    }
    
    // MARK: - Get basketball info
    func getBasketballInfo(completion: @escaping ([BasketballResponse]) -> Void) {
                var url = URLRequest(url: URL(string: "https://v1.basketball.api-sports.io/games?date=\(CustomDate.currentDate.rawValue.getCurrentDate())")!)
                url.allHTTPHeaderFields = [
                    "x-rapidapi-key" : "\(ApiKeys.sportsApiKey.rawValue)"
                ]
        
                let session = URLSession(configuration: .default)
                let task = session.dataTask(with: url) { data, response, error in
                    guard let data = data else { return }
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let response = try decoder.decode(MainBasketball.self, from: data)
                        DispatchQueue.main.async {
                            completion(response.response ?? [])
                        }
                    } catch {
                        print(String(describing: error))
                    }
                }
                task.resume()
    }
    
    
    // MARK: - Get hockey info
    func getHockeyInfo(completion: @escaping ([HockeyResponse]) -> Void) {
//                var url = URLRequest(url: URL(string: "https://v1.hockey.api-sports.io/games?date=\(CustomDate.currentDate.rawValue.getCurrentDate())")!)
//                url.allHTTPHeaderFields = [
//                    "x-rapidapi-key" : "\(ApiKeys.sportsApiKey.rawValue)"
//                ]
//
//                let session = URLSession(configuration: .default)
//                let task = session.dataTask(with: url) { data, response, error in
//                    guard let data = data else { return }
//                    do {
//                        let decoder = JSONDecoder()
//                        decoder.keyDecodingStrategy = .convertFromSnakeCase
//                        let response = try decoder.decode(MainHockey.self, from: data)
//                        DispatchQueue.main.async {
//                            completion(response.response ?? [])
//                        }
//                    } catch {
//                        print(String(describing: error))
//                    }
//                }
//                task.resume()
    }
    
    // MARK: - Get volleyball info
    func getVolleyballInfo(completion: @escaping ([VolleyballResponse]) -> Void) {
//                var url = URLRequest(url: URL(string: "https://v1.volleyball.api-sports.io/games?date=\(CustomDate.currentDate.rawValue.getCurrentDate())")!)
//                url.allHTTPHeaderFields = [
//                    "x-rapidapi-key" : "\(ApiKeys.sportsApiKey.rawValue)"
//                ]
//
//                let session = URLSession(configuration: .default)
//                let task = session.dataTask(with: url) { data, response, error in
//                    guard let data = data else { return }
//                    do {
//                        let decoder = JSONDecoder()
//                        decoder.keyDecodingStrategy = .convertFromSnakeCase
//                        let response = try decoder.decode(MainVolleyball.self, from: data)
//                        DispatchQueue.main.async {
//                            completion(response.response ?? [])
//                        }
//                    } catch {
//                        print(String(describing: error))
//                    }
//                }
//                task.resume()
    }
    
    // MARK: - Get handball info
    func getHandballInfo(completion: @escaping ([HandballResponse]) -> Void) {
//                var url = URLRequest(url: URL(string: "https://v1.handball.api-sports.io/games?date=\(CustomDate.currentDate.rawValue.getCurrentDate())")!)
//                url.allHTTPHeaderFields = [
//                    "x-rapidapi-key" : "\(ApiKeys.sportsApiKey.rawValue)"
//                ]
//
//                let session = URLSession(configuration: .default)
//                let task = session.dataTask(with: url) { data, response, error in
//                    guard let data = data else { return }
//                    do {
//                        let decoder = JSONDecoder()
//                        decoder.keyDecodingStrategy = .convertFromSnakeCase
//                        let response = try decoder.decode(MainHandball.self, from: data)
//                        DispatchQueue.main.async {
//                            completion(response.response ?? [])
//                        }
//                    } catch {
//                        print(String(describing: error))
//                    }
//                }
//                task.resume()
    }
    
    // MARK: - Get football ODDs info
    func getFootballOddsInfo(with fixture: Int, completion: @escaping ([FootballOddsResponse]) -> Void) {
//        var url = URLRequest(url: URL(string: "https://v3.football.api-sports.io/odds?fixture=\(fixture)")!)
//        url.allHTTPHeaderFields = [
//            "x-rapidapi-key" : "\(ApiKeys.sportsApiKey.rawValue)"
//        ]
//        let session = URLSession(configuration: .default)
//        let task = session.dataTask(with: url) { data, response, error in
//            guard let data = data else { return }
//            do {
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                let response = try decoder.decode(FootballOdds.self, from: data)
//                DispatchQueue.main.async {
//                    completion(response.response ?? [])
//                }
//            } catch {
//                print(String(describing: error))
//            }
//        }
//        task.resume()
    }
    
    // MARK: - Get football head to head info
    func getFootballHeadToHead(homeID: Int, awayID: Int, completion: @escaping([HeadToHeadFootballResponse]) -> Void) {
//        var url = URLRequest(url: URL(string: "https://v3.football.api-sports.io/fixtures/headtohead?h2h=\(homeID)-\(awayID)")!)
//        url.allHTTPHeaderFields = [
//            "x-rapidapi-key" : "\(ApiKeys.sportsApiKey.rawValue)"
//        ]
//        let session = URLSession(configuration: .default)
//        let task = session.dataTask(with: url) { data, response, error in
//            guard let data = data else { return }
//            do {
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                let response = try decoder.decode(MainHeadToHeadFootball.self, from: data)
//                DispatchQueue.main.async {
//                    completion(response.response ?? [])
//                }
//            } catch {
//                print(String(describing: error))
//            }
//        }
//        task.resume()
    }
    
    // MARK: - Get baseball ODDs info
    func getBaseballOddsInfo(with gameID: Int, completion: @escaping ([BaseballOddsResponse]) -> Void) {
//        var url = URLRequest(url: URL(string: "https://v3.football.api-sports.io/odds?fixture=\(gameID)")!)
//        url.allHTTPHeaderFields = [
//            "x-rapidapi-key" : "\(ApiKeys.sportsApiKey.rawValue)"
//        ]
//        let session = URLSession(configuration: .default)
//        let task = session.dataTask(with: url) { data, response, error in
//            guard let data = data else { return }
//            do {
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                let response = try decoder.decode(BaseballOdds.self, from: data)
//                DispatchQueue.main.async {
//                    completion(response.response ?? [])
//                }
//            } catch {
//                print(String(describing: error))
//            }
//        }
//        task.resume()
    }

    // MARK: - Get baseball head to head info
    func getBaseballHeadToHead(homeID: Int, awayID: Int, completion: @escaping([HeadToHeadBaseballResponse]) -> Void) {
//        var url = URLRequest(url: URL(string: "https://v1.baseball.api-sports.io/games/h2h?h2h=\(homeID)-\(awayID)")!)
//        url.allHTTPHeaderFields = [
//            "x-rapidapi-key" : "\(ApiKeys.sportsApiKey.rawValue)"
//        ]
//        let session = URLSession(configuration: .default)
//        let task = session.dataTask(with: url) { data, response, error in
//            guard let data = data else { return }
//            do {
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                let response = try decoder.decode(MainHeadToHeadBaseball.self, from: data)
//                DispatchQueue.main.async {
//                    completion(response.response ?? [])
//                }
//            } catch {
//                print(String(describing: error))
//            }
//        }
//        task.resume()
    }
    
    // MARK: - Get basketball head to head info
    func getBasketballHeadToHead(homeID: Int, awayID: Int, completion: @escaping([BasketballHthResponse]) -> Void) {
//        var url = URLRequest(url: URL(string: "https://v1.basketball.api-sports.io/games?h2h=\(homeID)-\(awayID)")!)
//        url.allHTTPHeaderFields = [
//            "x-rapidapi-key" : "\(ApiKeys.sportsApiKey.rawValue)"
//        ]
//        let session = URLSession(configuration: .default)
//        let task = session.dataTask(with: url) { data, response, error in
//            guard let data = data else { return }
//            do {
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                let response = try decoder.decode(MainBasketballHth.self, from: data)
//                DispatchQueue.main.async {
//                    completion(response.response ?? [])
//                }
//            } catch {
//                print(String(describing: error))
//            }
//        }
//        task.resume()
    }

    // MARK: - Get basketball ODDs info
    func getBasketballOddsInfo(with gameID: Int, completion: @escaping ([BasketballOddsResponse]) -> Void) {
//        var url = URLRequest(url: URL(string: "https://v1.basketball.api-sports.io/odds?game=\(gameID)")!)
//        url.allHTTPHeaderFields = [
//            "x-rapidapi-key" : "\(ApiKeys.sportsApiKey.rawValue)"
//        ]
//        let session = URLSession(configuration: .default)
//        let task = session.dataTask(with: url) { data, response, error in
//            guard let data = data else { return }
//            do {
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                let response = try decoder.decode(BasketballOdds.self, from: data)
//                DispatchQueue.main.async {
//                    completion(response.response ?? [])
//                }
//            } catch {
//                print(String(describing: error))
//            }
//        }
//        task.resume()
    }
    
    // MARK: - Get hockey head to head info
    func getHockeyHeadToHead(homeID: Int, awayID: Int, completion: @escaping([HockeyHthResponse]) -> Void) {
//        var url = URLRequest(url: URL(string: "https://v1.hockey.api-sports.io/games/h2h?h2h=\(homeID)-\(awayID)")!)
//        url.allHTTPHeaderFields = [
//            "x-rapidapi-key" : "\(ApiKeys.sportsApiKey.rawValue)"
//        ]
//        let session = URLSession(configuration: .default)
//        let task = session.dataTask(with: url) { data, response, error in
//            guard let data = data else { return }
//            do {
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                let response = try decoder.decode(MainHockeyHth.self, from: data)
//                DispatchQueue.main.async {
//                    completion(response.response ?? [])
//                }
//            } catch {
//                print(String(describing: error))
//            }
//        }
//        task.resume()
    }
    
    // MARK: - Get hockey head to head info
    func getVolleyballHeadToHead(homeID: Int, awayID: Int, completion: @escaping([VolleyballHthResponse]) -> Void) {
//        var url = URLRequest(url: URL(string: "https://v1.volleyball.api-sports.io/games/h2h?h2h=\(homeID)-\(awayID)")!)
//        url.allHTTPHeaderFields = [
//            "x-rapidapi-key" : "\(ApiKeys.sportsApiKey.rawValue)"
//        ]
//        let session = URLSession(configuration: .default)
//        let task = session.dataTask(with: url) { data, response, error in
//            guard let data = data else { return }
//            do {
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                let response = try decoder.decode(MainVolleyballHth.self, from: data)
//                DispatchQueue.main.async {
//                    completion(response.response ?? [])
//                }
//            } catch {
//                print(String(describing: error))
//            }
//        }
//        task.resume()
    }

    // MARK: - Get handball head to head info
    func getHandballHeadToHead(homeID: Int, awayID: Int, completion: @escaping([HandballHthResponse]) -> Void) {
//        var url = URLRequest(url: URL(string: "https://v1.handball.api-sports.io/games/h2h?h2h=\(homeID)-\(awayID)")!)
//        url.allHTTPHeaderFields = [
//            "x-rapidapi-key" : "\(ApiKeys.sportsApiKey.rawValue)"
//        ]
//        let session = URLSession(configuration: .default)
//        let task = session.dataTask(with: url) { data, response, error in
//            guard let data = data else { return }
//            do {
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                let response = try decoder.decode(MainHandballHth.self, from: data)
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
