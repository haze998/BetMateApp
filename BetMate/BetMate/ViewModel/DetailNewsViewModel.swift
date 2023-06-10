//
//  DetailViewModel.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 01.06.2023.
//

import Foundation

class DetailNewsViewModel {
    weak var coordinator: NewsCoordinator?
    var news: NewsArticle
    
    init(coordinator: NewsCoordinator? = nil, news: NewsArticle) {
        self.coordinator = coordinator
        self.news = news
    }
}
