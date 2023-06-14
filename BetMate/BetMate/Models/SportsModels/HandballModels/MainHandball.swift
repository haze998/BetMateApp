//
//  MainHandball.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 24.05.2023.
//

import Foundation

// MARK: - MainHandball
struct MainHandball: Codable {
    let parameters: HandballParameters?
    let results: Int?
    let response: [HandballResponse]?
}

// MARK: - Parameters
struct HandballParameters: Codable {
    let date: String?
}

// MARK: - Response
struct HandballResponse: Codable {
    let id: Int?
    let date: String?
    let time: String?
    let timestamp: Int?
    let week: String?
    let country: HandballCountry?
    let league: HandballLeague?
    let teams: HandballTeams?
    let scores: HandballScores?
    let periods: HandballPeriods?
}

// MARK: - Country
struct HandballCountry: Codable {
    let id: Int?
    let code: String?
    let flag: String?
}

// MARK: - League
struct HandballLeague: Codable {
    let id: Int?
    let logo: String?
    let season: Int?
}

// MARK: - Periods
struct HandballPeriods: Codable {
    let first, second: HandballScores?
}

// MARK: - Scores
struct HandballScores: Codable {
    let home, away: Int?
}

// MARK: - Teams
struct HandballTeams: Codable {
    let home, away: HandballAway?
}

// MARK: - Away
struct HandballAway: Codable {
    let id: Int?
    let name: String?
    let logo: String?
}
