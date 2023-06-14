//
//  FootballOdds.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 14.06.2023.
//

import Foundation

// MARK: - FootballOdds
struct FootballOdds: Codable {
    let welcomeGet: String?
    let parameters: FootballOddsParameters?
    let results: Int?
    let paging: FootballOddsPaging?
    let response: [FootballOddsResponse]?
}

// MARK: - Paging
struct FootballOddsPaging: Codable {
    let current, total: Int?
}

// MARK: - Parameters
struct FootballOddsParameters: Codable {
    let fixture: String?
}

// MARK: - Response
struct FootballOddsResponse: Codable {
    let league: FootballOddsLeague?
    let fixture: FootballOddsFixture?
    let update: Date?
    let bookmakers: [FootballBookmaker]?
}

// MARK: - Bookmaker
struct FootballBookmaker: Codable {
    let id: Int?
    let name: String?
    let bets: [FootballBet]?
}

// MARK: - Bet
struct FootballBet: Codable {
    let id: Int?
    let name: String?
    let values: [FootballValue]?
}

// MARK: - Value
struct FootballValue: Codable {
    let value, odd: String?
}

// MARK: - Fixture
struct FootballOddsFixture: Codable {
    let id: Int?
    let timezone: String?
    let date: Date?
    let timestamp: Int?
}

// MARK: - League
struct FootballOddsLeague: Codable {
    let id: Int?
    let name, country: String?
    let logo: String?
    let flag: String?
    let season: Int?
}
