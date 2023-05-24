//
//  BaseballResponse.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 23.05.2023.
//

import Foundation

// MARK: - Response
struct BaseballResponse: Codable {
    let id: Int?
    let date: String?
    let time: String?
    let timestamp: Int?
    let league: BaseballLeague?
    let teams: BasebalTeams?
    let scores: BaseballScores?
}
