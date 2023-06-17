//
//  MainVolleyballHth.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 17.06.2023.
//

import Foundation

// MARK: - MainVolleyballHth
struct MainVolleyballHth: Codable {
    let welcomeGet: String?
    let parameters: VolleyballHthParameters?
    let results: Int?
    let response: [VolleyballHthResponse]?
}

// MARK: - Parameters
struct VolleyballHthParameters: Codable {
    let h2H: String?
}

// MARK: - Response
struct VolleyballHthResponse: Codable {
    let id: Int?
    let date: String?
    let time: String?
    let timestamp: Int?
    let country: VolleyballHthCountry?
    let league: VolleyballHthLeague?
    let teams: VolleyballHthTeams?
    let scores: VolleyballHthScores?
    let periods: VolleyballHthPeriods?
}

// MARK: - Country
struct VolleyballHthCountry: Codable {
    let id: Int?
    let name: String?
}

// MARK: - League
struct VolleyballHthLeague: Codable {
    let id: Int?
    let name: String?
    let logo: String?
    let season: Int?
}

// MARK: - Periods
struct VolleyballHthPeriods: Codable {
    let first, second, third, fourth: VolleyballHthScores?
    let fifth: VolleyballHthScores?
}

// MARK: - Scores
struct VolleyballHthScores: Codable {
    let home, away: Int?
}

// MARK: - Teams
struct VolleyballHthTeams: Codable {
    let home, away: VolleyballHthAway?
}

// MARK: - Away
struct VolleyballHthAway: Codable {
    let id: Int?
    let name: String?
    let logo: String?
}
