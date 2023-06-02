//
//  ProfileViewModel.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 02.06.2023.
//

import Foundation

class ProfileViewModel {
    weak var coordinator: ProfileCoordinator?
    
    init(coordinator: ProfileCoordinator) {
        self.coordinator = coordinator
    }
    
    func goToLogout() {
        coordinator?.goToLogout()
    }
}
