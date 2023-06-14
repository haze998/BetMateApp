//
//  Constants.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 11.05.2023.
//

import Foundation

enum FontNames: String {
    case exoBold = "Exo-Bold"
    case exoSemiBold = "Exo-SemiBold"
    case exoMedium = "Exo-Medium"
}

enum ApiKeys: String {
    case newsApiKey = "YOUR_API_KEY"
    case sportsApiKey = "YOUR_API__KEY"
}

enum CustomDate: String {
    case currentDate
}

enum KindsOfSports {
    case football
    case baseball
    case basketball
    case hockey
    case volleyball
    case handball
}
