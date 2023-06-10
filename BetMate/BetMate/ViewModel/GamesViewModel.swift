//
//  GamesViewModel.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 20.05.2023.
//

import Foundation
import UIKit

class GamesViewModel {
    weak var coordinator: GamesCoordinator?
//    var football: FootballResponse?
    
    init(coordinator: GamesCoordinator) {
        self.coordinator = coordinator
    }
    
    func goToDetailGames(football: FootballResponse) {
        coordinator?.goToDetailGames(with: football)
    }
    
    // MARK: - Private properties
    private(set) var footballInfoArr: [FootballResponse] = []
    private(set) var baseballInfoArr: [BaseballResponse] = []
    private(set) var basketballInfoArr: [BasketballResponse] = []
    private(set) var hockeyInfoArr: [HockeyResponse] = []
    private(set) var volleyballInfoArr: [VolleyballResponse] = []
    private(set) var handballInfoArr: [HandballResponse] = []
    var sports: KindsOfSports = .football
    
    // MARK: - get fetched football info
    func fetchedFootballInfo(completion: @escaping () -> Void) {
        SportsNetworkManager.shared.getFootballInfo { result in
            self.footballInfoArr = result
            completion()
        }
    }
    
    // MARK: - get fetched baseball info
    func fetchedBaseballInfo(completion: @escaping () -> Void) {
        SportsNetworkManager.shared.getBaseballInfo { result in
            self.baseballInfoArr = result
            completion()
        }
    }
    
    // MARK: - get fetched basketball info
    func fetchedBasketballInfo(completion: @escaping () -> Void) {
        SportsNetworkManager.shared.getBasketballInfo { result in
            self.basketballInfoArr = result
            completion()
        }
    }
    
    // MARK: - get fetched handball info
    func fetchedHockeyInfo(comletion: @escaping () -> Void) {
        SportsNetworkManager.shared.getHockeyInfo { result in
            self.hockeyInfoArr = result
            comletion()
        }
    }
    
    // MARK: - get fetched rugby info
    func fetchedVolleyballInfo(comletion: @escaping () -> Void) {
        SportsNetworkManager.shared.getVolleyballInfo { result in
            self.volleyballInfoArr = result
            comletion()
        }
    }
    
    // MARK: - get fetched handball info
    func fetchedHandballInfo(comletion: @escaping () -> Void) {
        SportsNetworkManager.shared.getHandballInfo { result in
            self.handballInfoArr = result
            comletion()
        }
    }

}
