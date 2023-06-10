//
//  DetailGamesViewModel.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 10.06.2023.
//

import Foundation

class DetailGamesViewModel {
    weak var coordinator: GamesCoordinator?
    var football: FootballResponse
    
    init(coordinator: GamesCoordinator? = nil, football: FootballResponse) {
        self.coordinator = coordinator
        self.football = football
    }
}
