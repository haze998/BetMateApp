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
