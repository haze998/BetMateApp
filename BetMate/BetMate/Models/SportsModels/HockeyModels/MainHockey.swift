//
//  MainHockey.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 24.05.2023.
//

import Foundation

// MARK: - MainHockey
struct MainHockey: Codable {
    let welcomeGet: String?
    let parameters: HockeyParameters?
    let results: Int?
    let response: [HockeyResponse]?
}

// MARK: - Parameters
struct HockeyParameters: Codable {
    let date: String?
}

// MARK: - Response
struct HockeyResponse: Codable {
    let id: Int?
    let date: String?
    let time: String?
    let timestamp: Int?
    let week: String?
    let country: HockeyCountry?
    let league: HockeyLeague?
    let teams: HockeyTeams?
    let scores: HockeyScores?
    let events: Bool?
}

// MARK: - Country
struct HockeyCountry: Codable {
    let id: Int?
    let name: String?
    let code: String?
    let flag: String?
}

// MARK: - League
struct HockeyLeague: Codable {
    let id: Int?
    let name: String?
    let logo: String?
    let season: Int?
}

// MARK: - Scores
struct HockeyScores: Codable {
    let home, away: Int?
}

// MARK: - Teams
struct HockeyTeams: Codable {
    let home, away: HockeyAway?
}

// MARK: - Away
struct HockeyAway: Codable {
    let id: Int?
    let name: String?
    let logo: String?
}
