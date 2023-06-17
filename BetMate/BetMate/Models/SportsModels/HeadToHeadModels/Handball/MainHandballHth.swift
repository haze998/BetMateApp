//
//  MainHandballHth.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 17.06.2023.
//

import Foundation

// MARK: - MainHandballHth
struct MainHandballHth: Codable {
    let welcomeGet: String?
    let parameters: HandballHthParameters?
    let results: Int?
    let response: [HandballHthResponse]?
}

// MARK: - Parameters
struct HandballHthParameters: Codable {
    let h2H: String?
}

// MARK: - Response
struct HandballHthResponse: Codable {
    let id: Int?
    let date: String?
    let time: String?
    let timestamp: Int?
    let timezone, week: String?
    let status: HandballHthStatus?
    let country: HandballHthCountry?
    let league: HandballHthLeague?
    let teams: HandballHthTeams?
    let scores: HandballHthScores?
    let periods: HandballHthPeriods?
}

// MARK: - Country
struct HandballHthCountry: Codable {
    let id: Int?
    let name: String?
}

// MARK: - League
struct HandballHthLeague: Codable {
    let id: Int?
    let name, type: String?
    let logo: String?
    let season: Int?
}

// MARK: - Periods
struct HandballHthPeriods: Codable {
    let first, second: HandballHthScores?
}

// MARK: - Scores
struct HandballHthScores: Codable {
    let home, away: Int?
}

// MARK: - Status
struct HandballHthStatus: Codable {
    let long, short: String?
}

// MARK: - Teams
struct HandballHthTeams: Codable {
    let home, away: HandballHthAway?
}

// MARK: - Away
struct HandballHthAway: Codable {
    let id: Int?
    let name: String?
    let logo: String?
}
