//
//  BaseballOdds.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 17.06.2023.
//

import Foundation

// MARK: - BaseballOdds
struct BaseballOdds: Codable {
    let welcomeGet: String?
    let parameters: BaseballOddsParameters?
    let results: Int?
    let response: [BaseballOddsResponse]?
}

// MARK: - Parameters
struct BaseballOddsParameters: Codable {
    let game: String?
}

// MARK: - Response
struct BaseballOddsResponse: Codable {
    let league: BaseballOddsLeague?
    let country: BaseballOddsCountry?
    let game: BaseballOddsGame?
    let bookmakers: [BaseballOddsBookmaker]?
}

// MARK: - Bookmaker
struct BaseballOddsBookmaker: Codable {
    let id: Int?
    let name: String?
    let bets: [BaseballOddsBet]?
}

// MARK: - Bet
struct BaseballOddsBet: Codable {
    let id: Int?
    let name: String?
    let values: [BaseballOddsValue]?
}

// MARK: - Value
struct BaseballOddsValue: Codable {
    let value, odd: String?
}

// MARK: - Country
struct BaseballOddsCountry: Codable {
    let id: Int?
    let name, code: String?
    let flag: String?
}

// MARK: - Game
struct BaseballOddsGame: Codable {
    let id: Int?
    let date: String?
    let time: String?
    let timestamp: Int?
    let timezone: String?
    let status: BaseballOddsStatus?
    let country: BaseballOddsCountry?
    let league: BaseballOddsLeague?
    let teams: BaseballOddsTeams?
    let scores: BaseballOddsScores?
}

// MARK: - League
struct BaseballOddsLeague: Codable {
    let id: Int?
    let name, type: String?
    let season: Int?
    let logo: String?
}

// MARK: - Scores
struct BaseballOddsScores: Codable {
    let home, away: BaseballOddsScoresAway?
}

// MARK: - ScoresAway
struct BaseballOddsScoresAway: Codable {
    let hits, errors: Int?
    let total: Int?
}

// MARK: - Status
struct BaseballOddsStatus: Codable {
    let long, short: String?
}

// MARK: - Teams
struct BaseballOddsTeams: Codable {
    let home, away: BaseballOddsTeamsAway?
}

// MARK: - TeamsAway
struct BaseballOddsTeamsAway: Codable {
    let id: Int?
    let name: String?
    let logo: String?
}
