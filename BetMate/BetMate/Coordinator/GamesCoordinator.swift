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
        let gamesVC = GamesViewController()
        // Instantiate ViewModel
//        let viewModel =  OnboardingViewModel.init()
        // Set the Coordinator to the ViewModel
//        viewModel.coordinator = self
        // Set the ViewModel to ViewController
//        onboardVC.viewModel = viewModel
        // Push it.
        navigationController.pushViewController(gamesVC, animated: true)
    }

    
}
