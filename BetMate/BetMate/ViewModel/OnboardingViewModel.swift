//
//  OnboardingViewModel.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 28.05.2023.
//

import Foundation

class OnboardingViewModel {
    weak var coordinator: AuthCoordinator?
    
    func goToLogin() {
        coordinator?.goToLoginPage()
    }
    
    func goToRegister() {
        coordinator?.goToRegistryPage()
    }
}
