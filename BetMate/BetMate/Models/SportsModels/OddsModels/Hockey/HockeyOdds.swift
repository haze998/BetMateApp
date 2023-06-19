//
//  HockeyOdds.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 19.06.2023.
//

import Foundation

struct HockeyOdds : Codable {
    let get : String?
    let parameters : HockeyOddsParameters?
    let errors : [String]?
    let results : Int?
    let response : [HockeyOddsResponse]?
}

struct HockeyOddsParameters : Codable {
    let game : String?
}

struct HockeyOddsResponse : Codable {
    let league : HockeyOddsLeague?
    let country : HockeyOddsCountry?
    let game : HockeyOddsGame?
    let bookmakers : [HockeyOddsBookmakers]?
}

struct HockeyOddsBookmakers : Codable {
    let id : Int?
    let name : String?
    let bets : [HockeyOddsBets]?
}

struct HockeyOddsBets : Codable {
    let id : Int?
    let name : String?
    let values : [HockeyOddsValues]?
}

struct HockeyOddsValues : Codable {
    let value : String?
    let odd : String?
}

struct HockeyOddsLeague : Codable {
    let id : Int?
    let name : String?
    let type : String?
    let season : Int?
    let logo : String?
}

struct HockeyOddsCountry : Codable {
    let id : Int?
    let name : String?
    let code : String?
    let flag : String?
}

struct HockeyOddsGame : Codable {
    let id : Int?
    let date : String?
    let time : String?
    let timestamp : Int?
    let timezone : String?
    let week : String?
    let timer : String?
    let status : HockeyOddsStatus?
    let country : HockeyOddsCountry?
    let league : HockeyOddsLeague?
    let teams : HockeyOddsTeams?
    let scores : HockeyOddsScores?
    let periods : HockeyOddsPeriods?
    let events : Bool?
}

struct HockeyOddsTeams : Codable {
    let home : HockeyOddsHome?
    let away : HockeyOddsAway?
}

struct HockeyOddsHome : Codable {
    let id : Int?
    let name : String?
    let logo : String?
}

struct HockeyOddsAway : Codable {
    let id : Int?
    let name : String?
    let logo : String?
}

struct HockeyOddsScores : Codable {
    let home : Int?
    let away : Int?
}

struct HockeyOddsStatus : Codable {
    let long : String?
    let short : String?
}

struct HockeyOddsPeriods : Codable {
    let first : String?
    let second : String?
    let third : String?
    let overtime : String?
    let penalties : String?
}
