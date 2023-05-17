//
//  NewsArticle.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 17.05.2023.
//

import Foundation

struct NewsArticle: Codable {
    let source: NewsSource?
    let author: String?
    let title, description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}
