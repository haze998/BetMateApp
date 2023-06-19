//
//  VolleyballOdds.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 19.06.2023.
//

import Foundation

struct VolleyballOdds : Codable {
    let get : String?
    let parameters : VolleyballOddsParameters?
    let errors : [String]?
    let results : Int?
    let response : [VolleyballOddsResponse]?
}

struct VolleyballOddsParameters : Codable {
    let game : String?
}

struct VolleyballOddsResponse : Codable {
    let game : VolleyballOddsGame?
    let league : VolleyballOddsLeague?
    let country : VolleyballOddsCountry?
    let update : String?
    let bookmakers : [VolleyballOddsBookmakers]?
}

struct VolleyballOddsGame : Codable {
    let id : Int?
}

struct VolleyballOddsLeague : Codable {
    let id : Int?
    let name : String?
    let type : String?
    let season : Int?
    let logo : String?
}

struct VolleyballOddsCountry : Codable {
    let id : Int?
    let name : String?
    let code : String?
    let flag : String?
}

struct VolleyballOddsBookmakers : Codable {
    let id : Int?
    let name : String?
    let bets : [VolleyballOddsBets]?
}
struct VolleyballOddsBets : Codable {
    let id : Int?
    let name : String?
    let values : [VolleyballOddsValues]?
}

struct VolleyballOddsValues : Codable {
    let value : String?
    let odd : String?
}
