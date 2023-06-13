//
//  InfoLabel.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 10.06.2023.
//

import Foundation
import UIKit

class InfoLabel: UILabel {
    
    enum LabelType {
        case oddsInfo
        case matchInfo
        case headToHead
        case matchCountry
        case matchLeague
        case leagueType
        case matchDate
        case seasonDate
        case homeOdds
        case awayOdds
    }
    
    // MARK: - Private properties
    private let labelType: LabelType
    
    init(labelType: LabelType) {
        self.labelType = labelType
        super .init(frame: .zero)
        setupLabel()
    }
    
    private func setupLabel() {
        switch labelType {
        case .oddsInfo:
            font = UIFont(name: FontNames.exoSemiBold.rawValue, size: 30)
            text = "Odds"
            textColor = .labelColor
        case .matchInfo:
            font = UIFont(name: FontNames.exoSemiBold.rawValue, size: 30)
            text = "Match Info"
            textColor = .labelColor
        case .headToHead:
            font = UIFont(name: FontNames.exoSemiBold.rawValue, size: 30)
            text = "Head to Head"
            textColor = .labelColor
        case .matchCountry:
            font = UIFont(name: FontNames.exoBold.rawValue, size: 20)
            text = "Country :" + " " + "Undefined"
            textColor = .labelColor
        case .matchLeague:
            font = UIFont(name: FontNames.exoBold.rawValue, size: 20)
            text = "Challenge Cup :" + " " + "Undefined"
            textColor = .labelColor
        case .leagueType:
            font = UIFont(name: FontNames.exoBold.rawValue, size: 20)
            text = "Cup"
            textColor = .labelColor
        case .matchDate:
            font = UIFont(name: FontNames.exoBold.rawValue, size: 20)
            text = "19-08-2023 15:00"
            textColor = .labelColor
        case .seasonDate:
            font = UIFont(name: FontNames.exoBold.rawValue, size: 20)
            text = "2023"
            textColor = .labelColor
        case .homeOdds:
            font = UIFont(name: FontNames.exoBold.rawValue, size: 20)
            text = "1.234"
            textColor = .labelColor
        case .awayOdds:
            font = UIFont(name: FontNames.exoBold.rawValue, size: 20)
            text = "0.7"
            textColor = .labelColor
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
