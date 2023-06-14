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
    var basketball: BasketballResponse?
    var hockey: HockeyResponse?
    var volleyball: VolleyballResponse?
    var handball: HandballResponse?
    var sports: KindsOfSports = .football
    
    init(coordinator: GamesCoordinator? = nil, football: FootballResponse? = nil, baseball: BaseballResponse? = nil, basketball: BasketballResponse? = nil, hockey: HockeyResponse? = nil, volleyball: VolleyballResponse? = nil, handball: HandballResponse? = nil) {
        self.coordinator = coordinator
        self.football = football
        self.baseball = baseball
        self.basketball = basketball
        self.hockey = hockey
        self.volleyball = volleyball
        self.handball = handball
    }
}
