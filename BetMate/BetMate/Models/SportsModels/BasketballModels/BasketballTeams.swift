//
//  BasketballTeams.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 24.05.2023.
//

import Foundation

// MARK: - Teams
struct BasketballTeams: Codable {
    let home, away: BasketballTeamsAway?
}

// MARK: - TeamsAway
struct BasketballTeamsAway: Codable {
    let id: Int?
    let name: String?
    let logo: String?
}
