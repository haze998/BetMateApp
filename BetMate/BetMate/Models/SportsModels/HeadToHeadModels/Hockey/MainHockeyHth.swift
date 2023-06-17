//
//  MainHockeyHth.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 17.06.2023.
//

import Foundation

// MARK: - MainHockeyHth
struct MainHockeyHth: Codable {
    let welcomeGet: String?
    let parameters: HockeyHthParameters?
    let results: Int?
    let response: [HockeyHthResponse]?
}

// MARK: - Parameters
struct HockeyHthParameters: Codable {
    let h2H: String?
}

// MARK: - Response
struct HockeyHthResponse: Codable {
    let id: Int?
    let date: String?
    let time: String?
    let timestamp: Int?
    let week: String?
    let country: HockeyHthCountry?
    let teams: HockeyHthTeams?
    let scores: HockeyHthScores?
    let events: Bool?
}

// MARK: - Country
struct HockeyHthCountry: Codable {
    let id: Int?
    let name: String?
    let code: String?
    let flag: String?
}

// MARK: - Scores
struct HockeyHthScores: Codable {
    let home, away: Int?
}

// MARK: - Status
struct HockeyHthStatus: Codable {
    let long, short: String?
}

// MARK: - Teams
struct HockeyHthTeams: Codable {
    let home, away: HockeyHthAway?
}

// MARK: - Away
struct HockeyHthAway: Codable {
    let id: Int?
    let name: String?
    let logo: String?
}
