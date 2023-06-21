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
    
    // MARK: - get fetched hockey info
    func fetchedHockeyInfo(comletion: @escaping () -> Void) {
        SportsNetworkManager.shared.getHockeyInfo { result in
            self.hockeyInfoArr = result
            comletion()
        }
    }
    
    // MARK: - get fetched volleyball info
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

extension GamesViewModel {
    func goToDetailGames(baseball: BaseballResponse) {
        coordinator?.goToDetailGames(with: baseball)
    }
    
    func goToDetailGames(basketball: BasketballResponse) {
        coordinator?.goToDetailGames(with: basketball)
    }
    
    func goToDetailGames(hockey: HockeyResponse) {
        coordinator?.goToDetailGames(with: hockey)
    }
    
    func goToDetailGames(volleyball: VolleyballResponse) {
        coordinator?.goToDetailGames(with: volleyball)
    }
    
    func goToDetailGames(handball: HandballResponse) {
        coordinator?.goToDetailGames(with: handball)
    }
}
