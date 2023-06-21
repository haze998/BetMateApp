//
//  MainBasketball.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 24.05.2023.
//

import Foundation

// MARK: - MainBasketball
struct MainBasketball: Codable {
    let welcomeGet: String?
    let parameters: BasketballParameters?
    let results: Int?
    let response: [BasketballResponse]?
}

// MARK: - Parameters
struct BasketballParameters: Codable {
    let date: String?
}

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

// MARK: - Country
struct BasketballCountry: Codable {
    let id: Int?
    let name: String?
    let code: String?
    let flag: String?
}

// MARK: - League
struct BasketballLeague: Codable {
    let id: Int?
    let name: String?
    let logo: String?
}

// MARK: - Scores
struct BasketballScores: Codable {
    let home, away: BasketballScoresAway?
}

// MARK: - ScoresAway
struct BasketballScoresAway: Codable {
    let quarter1, quarter2, quarter3, quarter4: Int?
    let overTime, total: Int?
}

// MARK: - Teams
struct BasketballTeams: Codable {
    let home, away: BasketballTeamsAway?
}

// MARK: - TeamsAway
struct BasketballTeamsAway: Codable {
    let id: Int?
    let name: String?
    let logo: String?
}
