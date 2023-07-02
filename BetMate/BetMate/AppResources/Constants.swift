//
//  Constants.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 11.05.2023.
//

import Foundation

// MARK: - FontNames
enum FontNames: String {
    case exoBold = "Exo-Bold"
    case exoSemiBold = "Exo-SemiBold"
    case exoMedium = "Exo-Medium"
}

// MARK: - ImageNames
enum ImageNames: String {
    case carbonPassword = "carbon_password"
    case email = "email"
    case eyeSlash = "eye_slash"
    case eye = "eye"
    case user = "user"
    case addPhoto = "addphoto"
    case backArrow = "backArrow"
    case imagePlaceholder = "image_placeholder"
    case logout = "logout"
    case personalInfo = "personalInfo"
    case scrollup = "scrollup"
    case google = "google"
    case facebook = "facebook"
    case apple = "apple"
    case baseball = "baseball"
    case basketball = "basketball"
    case footballJersey = "football-jersey"
    case football = "football"
    case handball = "handball"
    case hockey = "hockey"
    case rugby = "rugby"
    case sportNews = "sportnews"
    case volleyball = "volleyball"
    case flame = "flame"
    case gamepad = "gamepad"
    case profile = "profile"
}

// MARK: - ApiKeys
enum ApiKeys: String {
    case newsApiKey = "YOUR_API_KEY1"
    case sportsApiKey = "YOUR_API_KEY2"
}

// MARK: - CustomDate
enum CustomDate: String {
    case currentDate
}

// MARK: - KindsOfSports
enum KindsOfSports {
    case football
    case baseball
    case basketball
    case hockey
    case volleyball
    case handball
}
