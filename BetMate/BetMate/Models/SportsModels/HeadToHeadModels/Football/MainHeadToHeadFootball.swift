import Foundation

struct MainHeadToHeadFootball : Codable {
	let get : String?
	let parameters : HeadToHeadFootballParameters?
	let errors : [String]?
	let results : Int?
	let paging : HeadToHeadFootballPaging?
	let response : [HeadToHeadFootballResponse]?
}

struct HeadToHeadFootballResponse : Codable {
    let fixture : HeadToHeadFootballFixture?
    let league : HeadToHeadFootballLeague?
    let teams : HeadToHeadFootballTeams?
    let goals : HeadToHeadFootballGoals?
    let score : HeadToHeadFootballScore?
}

struct HeadToHeadFootballAway : Codable {
    let id : Int?
    let name : String?
    let logo : String?
    let winner : Bool?
}

struct HeadToHeadFootballExtratime : Codable {
    let home : String?
    let away : String?
}

struct HeadToHeadFootballFixture : Codable {
    let id : Int?
    let referee : String?
    let timezone : String?
    let date : String?
    let timestamp : Int?
    let periods : HeadToHeadFootballPeriods?
    let venue : HeadToHeadFootballVenue?
    let status : HeadToHeadFootballStatus?
}

struct HeadToHeadFootballFulltime : Codable {
    let home : Int?
    let away : Int?
}

struct HeadToHeadFootballGoals : Codable {
    let home : Int?
    let away : Int?
}

struct HeadToHeadFootballHalftime : Codable {
    let home : Int?
    let away : Int?
}

struct HeadToHeadFootballHome : Codable {
    let id : Int?
    let name : String?
    let logo : String?
    let winner : Bool?
}

struct HeadToHeadFootballLeague : Codable {
    let id : Int?
    let name : String?
    let country : String?
    let logo : String?
    let flag : String?
    let season : Int?
    let round : String?
}

struct HeadToHeadFootballPaging : Codable {
    let current : Int?
    let total : Int?
}

struct HeadToHeadFootballParameters : Codable {
    let h2h : String?
}

struct HeadToHeadFootballPenalty : Codable {
    let home : String?
    let away : String?
}

struct HeadToHeadFootballPeriods : Codable {
    let first : Int?
    let second : Int?
}

struct HeadToHeadFootballScore : Codable {
    let halftime : HeadToHeadFootballHalftime?
    let fulltime : HeadToHeadFootballFulltime?
    let extratime : HeadToHeadFootballExtratime?
    let penalty : HeadToHeadFootballPenalty?
}

struct HeadToHeadFootballStatus : Codable {
    let long : String?
    let short : String?
    let elapsed : Int?
}

struct HeadToHeadFootballTeams : Codable {
    let home : HeadToHeadFootballHome?
    let away : HeadToHeadFootballAway?
}

struct HeadToHeadFootballVenue : Codable {
    let id : Int?
    let name : String?
    let city : String?
}

