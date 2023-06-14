//
//  Scores.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 23.05.2023.
//

import Foundation

// MARK: - Scores
struct BaseballScores: Codable {
    let home, away: BaseballScoresAway?
}

// MARK: - ScoresAway
struct BaseballScoresAway: Codable {
    let hits, errors: Int?
    let total: Int?
}
