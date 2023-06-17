//
//  DetailGamesViewModel.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 10.06.2023.
//

import Foundation

class DetailGamesViewModel {
    
    // MARK: - Properties
    weak var coordinator: GamesCoordinator?
    var football: FootballResponse?
    var baseball: BaseballResponse?
    var basketball: BasketballResponse?
    var hockey: HockeyResponse?
    var volleyball: VolleyballResponse?
    var handball: HandballResponse?
    var sports: KindsOfSports = .football
    var footballOddsArr: [FootballOddsResponse] = []
    var footballHthArr: [HeadToHeadFootballResponse] = []
    var baseballHthArr: [HeadToHeadBaseballResponse] = []
    
    // MARK: - init
    init(coordinator: GamesCoordinator? = nil, football: FootballResponse? = nil, baseball: BaseballResponse? = nil, basketball: BasketballResponse? = nil, hockey: HockeyResponse? = nil, volleyball: VolleyballResponse? = nil, handball: HandballResponse? = nil) {
        self.coordinator = coordinator
        self.football = football
        self.baseball = baseball
        self.basketball = basketball
        self.hockey = hockey
        self.volleyball = volleyball
        self.handball = handball
    }
    
    // MARK: - Fetch football odds
    func fetchFootballOdds(completion: @escaping () -> Void) {
//        SportsNetworkManager.shared.getFootballOddsInfo(with: football?.fixture.id ?? 0) { result in
//            self.footballOddsArr = result
//            completion()
//        }
    }
    
    // MARK: - Fetch football h2h
    func fetchHtHFootbal(completion: @escaping () -> Void) {
        SportsNetworkManager.shared.getFootballHeadToHead(homeID: football?.teams.home.id ?? 0, awayID: football?.teams.away.id ?? 0) { result in
            self.footballHthArr = result
            completion()
        }
    }
    
    // MARK: - Fetch baseball h2h
    func fetchHtHBaseball(completion: @escaping () -> Void) {
        SportsNetworkManager.shared.getBaseballHeadToHead(homeID: baseball?.teams?.home?.id ?? 0, awayID: baseball?.teams?.away?.id ?? 0) { result in
            self.baseballHthArr = result
            completion()
        }
    }
}
