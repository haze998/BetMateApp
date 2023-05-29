//
//  ProfileCoordinator.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 29.05.2023.
//

import Foundation
import UIKit

class ProfileCoordinator : Coordinator {
    weak var parentCoordinator: Coordinator?
    var childrenCoordinator: [Coordinator] = []
    var navigationController: UINavigationController
    
    func start() {
        goToProfilePage()
    }
    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    func goToProfilePage() {
        // Instantiate ViewController
        let profileVC = ProfileViewController()
        // Instantiate ViewModel
//        let viewModel =  OnboardingViewModel.init()
        // Set the Coordinator to the ViewModel
//        viewModel.coordinator = self
        // Set the ViewModel to ViewController
//        onboardVC.viewModel = viewModel
        // Push it.
        navigationController.pushViewController(profileVC, animated: true)
    }
    
}

