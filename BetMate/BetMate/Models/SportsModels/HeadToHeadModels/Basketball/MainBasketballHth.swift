//
//  MainBasketballHth.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 17.06.2023.
//

import Foundation

// MARK: - MainBasketballHth
struct MainBasketballHth: Codable {
    let welcomeGet: String?
    let parameters: BasketballHthParameters?
    let results: Int?
    let response: [BasketballHthResponse]?
}

// MARK: - Parameters
struct BasketballHthParameters: Codable {
    let h2H: String?
}

// MARK: - Response
struct BasketballHthResponse: Codable {
    let id: Int?
    let date: String?
    let time: String?
    let timestamp: Int?
//    let league: BasketballHthLeague?
    let country: BasketballHthCountry?
    let teams: BasketballHthTeams?
    let scores: BasketballHthScores?
}

// MARK: - Country
struct BasketballHthCountry: Codable {
    let id: Int?
    let flag: String?
}

// MARK: - League
//struct BasketballHthLeague: Codable {
//    let id: Int?
//    let season: Int?
//    let logo: String?
//}

// MARK: - Scores
struct BasketballHthScores: Codable {
    let home, away: BasketballHthScoresAway?
}

// MARK: - ScoresAway
struct BasketballHthScoresAway: Codable {
    let quarter1, quarter2, quarter3, quarter4: Int?
    let overTime, total: Int?
}

// MARK: - Teams
struct BasketballHthTeams: Codable {
    let home, away: BasketballHthTeamsAway?
}

// MARK: - TeamsAway
struct BasketballHthTeamsAway: Codable {
    let id: Int?
    let name: String?
    let logo: String?
}
