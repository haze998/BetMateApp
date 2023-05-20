//
//  GamesViewModel.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 20.05.2023.
//

import Foundation
import UIKit

class GamesViewModel {
    
    private let sport: Sport
    
    init(sport: Sport) {
        self.sport = sport
    }
    
    var name : String {
        return sport.sportName
    }
    
    var icon: UIImage {
        return sport.icon
    }
}
