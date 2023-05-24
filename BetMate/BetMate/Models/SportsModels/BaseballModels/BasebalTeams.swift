//
//  BasebalTeams.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 23.05.2023.
//

import Foundation

// MARK: - Teams
struct BasebalTeams: Codable {
    let home, away: BaseballTeamsAway?
}

// MARK: - TeamsAway
struct BaseballTeamsAway: Codable {
    let id: Int?
    let name: String?
    let logo: String?
}
