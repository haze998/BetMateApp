//
//  AuthCoordinator.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 28.05.2023.
//

import Foundation
import UIKit

class AuthCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    var childrenCoordinator: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        print("AuthCoordinator Start")
        goToOnboardPage()
    }
    
    func goToOnboardPage() {
        // Instantiate ViewController
        let onboardVC = OnboardingViewController()
        // Instantiate ViewModel
        let viewModel =  OnboardingViewModel.init()
        // Set the Coordinator to the ViewModel
        viewModel.coordinator = self
        // Set the ViewModel to ViewController
        onboardVC.viewModel = viewModel
        // Push it.
        navigationController.pushViewController(onboardVC, animated: true)
    }
    
    func goToLoginPage() {
        let loginVC = LoginViewController()
        let viewModel = LoginViewModel.init()
        viewModel.coordinator = self
        loginVC.viewModel = viewModel
        navigationController.pushViewController(loginVC, animated: true)
    }
    
    func goToRegistryPage() {
        let registryVC = RegistryViewController()
        let viewModel = RegistryViewModel.init()
        viewModel.coordinator = self
        registryVC.viewModel = viewModel
        navigationController.pushViewController(registryVC, animated: true)
    }
    
    func goToForgotPassPage() {
        let forgotPassVC = ForgotPasswordViewController()
        let viewModel = ForgotPassViewModel.init()
        viewModel.coordinator = self
        forgotPassVC.viewModel = viewModel
        navigationController.pushViewController(forgotPassVC, animated: true)
    }
    
    func goToTabBarPage() {
        let appC = parentCoordinator as? AppCoordinator
        let transition = CATransition()
        transition.duration = 0.7
        transition.type = CATransitionType.fade
        navigationController.view.layer.add(transition, forKey: kCATransition)
        appC?.showTabBar()
        // Remember to clean up
        parentCoordinator?.childrenDidFinish(self)
    }
    
    deinit {
        print("AuthCoordinator Deinit")
    }
}
