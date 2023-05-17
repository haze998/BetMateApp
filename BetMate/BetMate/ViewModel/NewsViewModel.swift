//
//  NewsViewModel.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 17.05.2023.
//

import Foundation

class NewsViewModel {
    
    var sportNews: [NewsArticle] = []
    
    // MARK: - Fetched News
    func fetchedNews(completion: @escaping() -> Void) {
        NewsNetworkManager.shared.getNews { news in
//            guard let self = self else { return }
            
            self.sportNews = news
            completion()
        }
    }
}
