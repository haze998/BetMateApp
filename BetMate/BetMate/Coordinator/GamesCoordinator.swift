//
//  GamesCoordinator.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 29.05.2023.
//

import Foundation
import UIKit

class GamesCoordinator : Coordinator {
    weak var parentCoordinator: Coordinator?
    var childrenCoordinator: [Coordinator] = []
    var navigationController: UINavigationController
    
    func start() {
        goToGamesPage()
    }
    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    func goToGamesPage() {
        // Instantiate ViewController
        let viewModel = GamesViewModel(coordinator: self)
        let gamesVC = GamesViewController(viewModel: viewModel)
        navigationController.navigationBar.isHidden = true
        navigationController.pushViewController(gamesVC, animated: true)
    }
    
    func goToDetailGames(with football: FootballResponse) {
        let viewModel = DetailGamesViewModel(coordinator: self, football: football)
        let vc = DetailGamesViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
}

extension GamesCoordinator {
    
    func goToDetailGames(with baseball: BaseballResponse) {
        let viewModel = DetailGamesViewModel(coordinator: self, baseball: baseball)
        let vc = DetailGamesViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goToDetailGames(with basketball: BasketballResponse) {
        let viewModel = DetailGamesViewModel(coordinator: self, basketball: basketball)
        let vc = DetailGamesViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goToDetailGames(with hockey: HockeyResponse) {
        let viewModel = DetailGamesViewModel(coordinator: self, hockey: hockey)
        let vc = DetailGamesViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goToDetailGames(with volleyball: VolleyballResponse) {
        let viewModel = DetailGamesViewModel(coordinator: self, volleyball: volleyball)
        let vc = DetailGamesViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goToDetailGames(with handball: HandballResponse) {
        let viewModel = DetailGamesViewModel(coordinator: self, handball: handball)
        let vc = DetailGamesViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
}
