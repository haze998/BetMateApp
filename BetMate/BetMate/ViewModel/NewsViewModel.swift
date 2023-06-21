//
//  NewsViewModel.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 17.05.2023.
//

import Foundation

class NewsViewModel {
    
    weak var coordinator: NewsCoordinator?
    var sportNews: [NewsArticle] = []
    
    init(coordinator: NewsCoordinator) {
        self.coordinator = coordinator
    }
    
    func goToDetailNews(news: NewsArticle) {
        coordinator?.goToDetailNews(with: news)
    }
    
    // MARK: - Fetched News
    func fetchedNews(completion: @escaping() -> Void) {
        NewsNetworkManager.shared.getNews { news in
            self.sportNews = news
            completion()
        }
    }
}
