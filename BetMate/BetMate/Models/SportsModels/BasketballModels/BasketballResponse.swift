//
//  BasketballResponse.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 24.05.2023.
//

import Foundation

// MARK: - Response
struct BasketballResponse: Codable {
    let id: Int?
    let date: String?
    let time: String?
    let timestamp: Int?
    let week: String?
    let league: BasketballLeague?
    let country: BasketballCountry?
    let teams: BasketballTeams?
    let scores: BasketballScores?
}
