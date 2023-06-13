//
//  DetailGamesViewModel.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 10.06.2023.
//

import Foundation

class DetailGamesViewModel {
    weak var coordinator: GamesCoordinator?
    var football: FootballResponse?
    var baseball: BaseballResponse?
    var sports: KindsOfSports = .football
    
    init(coordinator: GamesCoordinator? = nil, football: FootballResponse? = nil, baseball: BaseballResponse? = nil) {
        self.coordinator = coordinator
        self.football = football
        self.baseball = baseball
    }
}
