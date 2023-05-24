//
//  MainBaseball.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 23.05.2023.
//

import Foundation

// MARK: - MainBaseball
struct MainBaseball: Codable {
    let welcomeGet: String?
    let parameters: BaseballParameters?
    let results: Int?
    let response: [BaseballResponse]?
}
