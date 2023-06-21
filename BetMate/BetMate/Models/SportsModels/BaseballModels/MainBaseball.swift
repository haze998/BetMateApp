//
//  MainBaseball.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 23.05.2023.
//

import Foundation

// MARK: - MainBaseball
struct MainBaseball: Codable {
    let welcomeGet: String?
    let parameters: BaseballParameters?
    let results: Int?
    let response: [BaseballResponse]?
}

// MARK: - Parameters
struct BaseballParameters: Codable {
    let date: String?
}

// MARK: - Response
struct BaseballResponse: Codable {
    let id: Int?
    let date: String?
    let time: String?
    let timestamp: Int?
    let league: BaseballLeague?
    let teams: BasebalTeams?
    let scores: BaseballScores?
}

// MARK: - League
struct BaseballLeague: Codable {
    let id: Int?
    let logo: String?
    let season: Int?
}

// MARK: - Scores
struct BaseballScores: Codable {
    let home, away: BaseballScoresAway?
}

// MARK: - ScoresAway
struct BaseballScoresAway: Codable {
    let hits, errors: Int?
    let total: Int?
}

// MARK: - Teams
struct BasebalTeams: Codable {
    let home, away: BaseballTeamsAway?
}

// MARK: - TeamsAway
struct BaseballTeamsAway: Codable {
    let id: Int?
    let name: String?
    let logo: String?
}
