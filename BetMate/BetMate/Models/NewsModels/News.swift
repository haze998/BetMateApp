//
//  News.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 17.05.2023.
//

import Foundation

// MARK: - News
struct News: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [NewsArticle]?
}

