//
//  MainHeadToHeadBaseball.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 17.06.2023.
// HeadToHeadBaseball

import Foundation

// MARK: - Welcome
struct MainHeadToHeadBaseball: Codable {
    let welcomeGet: String?
    let parameters: HeadToHeadBaseballParameters?
    let results: Int?
    let response: [HeadToHeadBaseballResponse]?
}

// MARK: - Parameters
struct HeadToHeadBaseballParameters: Codable {
    let h2H: String?
}

// MARK: - Response
struct HeadToHeadBaseballResponse: Codable {
    let id: Int?
    let date: String?
    let time: String?
    let timestamp: Int?
    let week: String?
    let country: HeadToHeadBaseballCountry?
    let league: HeadToHeadBaseballLeague?
    let teams: HeadToHeadBaseballTeams?
    let scores: HeadToHeadBaseballScores?
}

// MARK: - Country
struct HeadToHeadBaseballCountry: Codable {
    let id: Int?
    let flag: String?
}

// MARK: - League
struct HeadToHeadBaseballLeague: Codable {
    let id: Int?
    let logo: String?
    let season: Int?
}

// MARK: - Scores
struct HeadToHeadBaseballScores: Codable {
    let home, away: HeadToHeadBaseballScoresAway?
}

// MARK: - ScoresAway
struct HeadToHeadBaseballScoresAway: Codable {
    let hits, errors: Int?
    let total: Int?
}

// MARK: - Teams
struct HeadToHeadBaseballTeams: Codable {
    let home, away: HeadToHeadBaseballTeamsAway?
}

// MARK: - TeamsAway
struct HeadToHeadBaseballTeamsAway: Codable {
    let id: Int?
    let name: String?
    let logo: String?
}
