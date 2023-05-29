//
//  RegistryViewModel.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 28.05.2023.
//

import Foundation

class RegistryViewModel {
    weak var coordinator: AuthCoordinator?
    
    func goToTabBar() {
        coordinator?.goToTabBarPage()
    }
    
    func goToLogin() {
        coordinator?.goToLoginPage()
    }
}
