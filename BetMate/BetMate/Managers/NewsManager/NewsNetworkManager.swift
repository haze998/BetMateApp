//
//  NewsManager.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 17.05.2023.
//

import Foundation

class NewsNetworkManager {
    
    static let shared = NewsNetworkManager()
    
    private init() { }
    
    // MARK: - Get News
    func getNews(completion: @escaping([NewsArticle]) -> Void) {
        guard let apiUrl = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=\(ApiKeys.newsApiKey.rawValue)") else { fatalError("Invalid URL")
        }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: apiUrl) { data, response, error in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let response = try decoder.decode(News.self, from: data)
                DispatchQueue.main.async {
                    completion(response.articles ?? [])
                }
            } catch {
                print("Error \(error.localizedDescription)")
            }
        }
        task.resume()
    }
}
