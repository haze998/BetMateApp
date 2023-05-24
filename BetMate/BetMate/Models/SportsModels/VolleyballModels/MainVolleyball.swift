//
//  MainVolleyball.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 24.05.2023.
//

import Foundation

// MARK: - MainVolleyball
struct MainVolleyball: Codable {
    let welcomeGet: String?
    let parameters: VolleyballParameters?
    let results: Int?
    let response: [VolleyballResponse]?
}

// MARK: - Parameters
struct VolleyballParameters: Codable {
    let date: String?
}

// MARK: - Response
struct VolleyballResponse: Codable {
    let id: Int?
    let date: String?
    let time: String?
    let timestamp: Int?
    let week: String?
    let country: VolleyballCountry?
    let league: VolleyballLeague?
    let teams: VolleyballTeams?
    let scores: VolleyballScores?
    let periods: VolleyballPeriods?
}

// MARK: - Country
struct VolleyballCountry: Codable {
    let id: Int?
    let flag: String?
}

// MARK: - League
struct VolleyballLeague: Codable {
    let id: Int?
    let logo: String?
    let season: Int?
}

// MARK: - Periods
struct VolleyballPeriods: Codable {
    let first, second, third, fourth: VolleyballScores?
    let fifth: VolleyballScores?
}

// MARK: - Scores
struct VolleyballScores: Codable {
    let home, away: Int?
}

// MARK: - Teams
struct VolleyballTeams: Codable {
    let home, away: VolleyballAway?
}

// MARK: - Away
struct VolleyballAway: Codable {
    let id: Int?
    let name: String?
    let logo: String?
}
