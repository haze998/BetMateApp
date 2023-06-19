//
//  BasketballOdds.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 17.06.2023.
//

import Foundation

// MARK: - BasketballOdds
struct BasketballOdds: Codable {
    let get : String?
    let parameters : BasketballOddsParameters?
    let errors : [String]?
    let results : Int?
    let response : [BasketballOddsResponse]?
}

// MARK: - Parameters
struct BasketballOddsParameters: Codable {
    let game : String?
}

// MARK: - Response
struct BasketballOddsResponse: Codable {
    let league: BasketballOddsLeague?
    let country: BasketballOddsCountry?
    let game: BasketballOddsGame?
    let bookmakers: [BasketballOddsBookmaker]?
}

// MARK: - Bookmaker
struct BasketballOddsBookmaker: Codable {
    let id : Int?
    let name : String?
    let bets : [BasketballOddsBet]?
}

// MARK: - Bet
struct BasketballOddsBet: Codable {
    let id : Int?
    let name : String?
    let values : [BasketballOddsValue]?
}

// MARK: - Value
struct BasketballOddsValue: Codable {
    let value : String?
    let odd : String?
}

// MARK: - Country
struct BasketballOddsCountry: Codable {
    let id : Int?
    let name : String?
    let code : String?
    let flag : String?
}

// MARK: - Game
struct BasketballOddsGame: Codable {
    let id : Int?
    let date : String?
    let time : String?
    let timestamp : Int?
    let timezone : String?
    let stage : String?
    let week : String?
    let status : BasketballOddsStatus?
    let league : BasketballOddsLeague?
//    let country : Country?
    let teams : BasketballOddsTeams?
    let scores : BasketballOddsScores?
}

// MARK: - League
struct BasketballOddsLeague: Codable {
    let id : Int?
    let name : String?
    let type : String?
    let season : Int?
    let logo : String?
}

// MARK: - Scores
struct BasketballOddsScores: Codable {
    let home, away: BasketballOddsScoresAway?
}

// MARK: - ScoresAway
struct BasketballOddsScoresAway: Codable {
    let quarter1, quarter2, quarter3, quarter4: Int?
    let total: Int?
}

// MARK: - Status
struct BasketballOddsStatus: Codable {
    let long, short: String?
}

// MARK: - Teams
struct BasketballOddsTeams: Codable {
    let home, away: BasketballOddsTeamsAway?
}

// MARK: - TeamsAway
struct BasketballOddsTeamsAway: Codable {
    let id: Int?
    let name: String?
    let logo: String?
}
