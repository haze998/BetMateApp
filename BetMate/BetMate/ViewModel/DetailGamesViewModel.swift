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
    var baseballOddsArr: [BaseballOddsResponse] = []
    var basketballHthArr: [BasketballHthResponse] = []
    var basketballOddsArr: [BasketballOddsResponse] = []
    var hockeyHthArr: [HockeyHthResponse] = []
    var volleyballHthArr: [VolleyballHthResponse] = []
    var handballHthArr: [HandballHthResponse] = []


    
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
        SportsNetworkManager.shared.getFootballOddsInfo(with: football?.fixture.id ?? 0) { result in
            self.footballOddsArr = result
            completion()
        }
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
    
    // MARK: - Fetch baseball odds
    func fetchBaseballOdds(completion: @escaping () -> Void) {
        SportsNetworkManager.shared.getBaseballOddsInfo(with: baseball?.id ?? 0) { result in
            self.baseballOddsArr = result
            completion()
        }
    }
    
    // MARK: - Fetch basketball h2h
    func fetchHtHbasketball(completion: @escaping () -> Void) {
        SportsNetworkManager.shared.getBasketballHeadToHead(homeID: baseball?.teams?.home?.id ?? 0, awayID: baseball?.teams?.away?.id ?? 0) { result in
            self.basketballHthArr = result
            completion()
        }
    }
    
    // MARK: - Fetch basketball odds
    func fetchBasketballOdds(completion: @escaping () -> Void) {
        SportsNetworkManager.shared.getBasketballOddsInfo(with: basketball?.id ?? 0) { result in
            self.basketballOddsArr = result
            completion()
        }
    }
    
    // MARK: - Fetch hockey h2h
    func fetchHtHhockey(completion: @escaping () -> Void) {
        SportsNetworkManager.shared.getHockeyHeadToHead(homeID: hockey?.teams?.home?.id ?? 0, awayID: hockey?.teams?.away?.id ?? 0) { result in
            self.hockeyHthArr = result
            completion()
        }
    }
    
    // MARK: - Fetch volleyball h2h
    func fetchHtHVolleyball(completion: @escaping () -> Void) {
        SportsNetworkManager.shared.getVolleyballHeadToHead(homeID: volleyball?.teams?.home?.id ?? 0, awayID: volleyball?.teams?.away?.id ?? 0) { result in
            self.volleyballHthArr = result
            completion()
        }
    }
    
    // MARK: - Fetch handball h2h
    func fetchHtHHandball(completion: @escaping () -> Void) {
        SportsNetworkManager.shared.getHandballHeadToHead(homeID: handball?.teams?.home?.id ?? 0, awayID: handball?.teams?.away?.id ?? 0) { result in
            self.handballHthArr = result
            completion()
        }
    }
}
