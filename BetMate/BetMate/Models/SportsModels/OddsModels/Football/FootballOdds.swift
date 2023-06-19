//
//  FootballOdds.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 14.06.2023.
//

import Foundation

// MARK: - FootballOdds
struct FootballOdds: Codable {
    let get : String?
    let parameters : FootballOddsParameters?
    let errors : [String]?
    let results : Int?
    let paging : FootballOddsPaging?
    let response : [FootballOddsResponse]?
}

// MARK: - Paging
struct FootballOddsPaging: Codable {
    let current : Int?
    let total : Int?
}

// MARK: - Parameters
struct FootballOddsParameters: Codable {
    let fixture : String?
}

// MARK: - Response
struct FootballOddsResponse: Codable {
    let league : FootballOddsLeague?
    let fixture : FootballOddsFixture?
    let update : String?
    let bookmakers : [FootballBookmaker]?
}

// MARK: - Bookmaker
struct FootballBookmaker: Codable {
    let id : Int?
    let name : String?
    let bets : [FootballBet]?
}

// MARK: - Bet
struct FootballBet: Codable {
    let id : Int?
    let name : String?
    let values : [FootballValue]?
}

// MARK: - Value
struct FootballValue: Codable {
    let value : String?
    let odd : String?
}

// MARK: - Fixture
struct FootballOddsFixture: Codable {
    let id : Int?
    let timezone : String?
    let date : String?
    let timestamp : Int?
}

// MARK: - League
struct FootballOddsLeague: Codable {
    let id : Int?
    let name : String?
    let country : String?
    let logo : String?
    let flag : String?
    let season : Int?
}
