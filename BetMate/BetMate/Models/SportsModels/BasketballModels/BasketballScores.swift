//
//  BasketballScores.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 24.05.2023.
//

import Foundation

// MARK: - Scores
struct BasketballScores: Codable {
    let home, away: BasketballScoresAway?
}

// MARK: - ScoresAway
struct BasketballScoresAway: Codable {
    let quarter1, quarter2, quarter3, quarter4: Int?
    let overTime, total: Int?
}
