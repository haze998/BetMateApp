//
//  FootballModels.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 08.06.2023.
//

import Foundation

// MARK: - MainFootball
struct MainFootball: Codable {
//    let welcomeGet: String
    let parameters: FootballParameters
    let results: Int
    let paging: FootballPaging
    let response: [FootballResponse]
}

// MARK: - Paging
struct FootballPaging: Codable {
    let current, total: Int
}

// MARK: - Parameters
struct FootballParameters: Codable {
    let date: String
}

// MARK: - Response
struct FootballResponse: Codable {
    let fixture: FootballFixture
    let league: FootballLeague
    let teams: FootballTeams
    let goals: FootballGoals
    let score: FootballScore
}

// MARK: - Fixture
struct FootballFixture: Codable {
    let id: Int
    let referee: String?
//    let timezone: Timezone
    let date: String
    let timestamp: Int
    let periods: FootballPeriods
    let venue: FootballVenue
//    let status: FootballStatus
}

// MARK: - Periods
struct FootballPeriods: Codable {
    let first, second: Int?
}

//// MARK: - Status
//struct FootballStatus: Codable {
//    let long: Long
//    let short: Short
//    let elapsed: Int?
//}

//enum Long: String, Codable {
//    case matchCancelled = "Match Cancelled"
//    case matchFinished = "Match Finished"
//    case matchPostponed = "Match Postponed"
//}
//
//enum Short: String, Codable {
//    case aet = "AET"
//    case canc = "CANC"
//    case ft = "FT"
//    case pen = "PEN"
//    case pst = "PST"
//}
//
//enum Timezone: String, Codable {
//    case utc = "UTC"
//}

// MARK: - Venue
struct FootballVenue: Codable {
    let id: Int?
    let name, city: String?
}

// MARK: - Goals
struct FootballGoals: Codable {
    let home, away: Int?
}

// MARK: - League
struct FootballLeague: Codable {
    let id: Int
    let name, country: String
    let logo: String
    let flag: String?
    let season: Int
    let round: String
}

// MARK: - Score
struct FootballScore: Codable {
    let halftime, fulltime, extratime, penalty: FootballGoals
}

// MARK: - Teams
struct FootballTeams: Codable {
    let home, away: FootballAway
}

// MARK: - Away
struct FootballAway: Codable {
    let id: Int
    let name: String
    let logo: String
    let winner: Bool?
}
