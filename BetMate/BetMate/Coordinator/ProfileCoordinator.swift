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
        let viewModel = ProfileViewModel(coordinator: self)
        let profileVC = ProfileViewController(viewModel: viewModel)
        navigationController.pushViewController(profileVC, animated: true)
    }
    
    func goToLogout() {
////        childrenCoordinator.removeAll()
//        let appC = parentCoordinator as? AppCoordinator
////        appC?.childrenCoordinator.append(appC!)
//        appC?.showAuth()
//        parentCoordinator?.childrenDidFinish(self)
        
        guard let appCoordinator = parentCoordinator as? AppCoordinator else {
                return
            }
            
            // Удалите текущий ProfileCoordinator из childrenCoordinator
            parentCoordinator?.childrenDidFinish(self)
            
            // Сбросьте состояние AuthCoordinator перед повторным использованием
            appCoordinator.childrenCoordinator.removeAll()
            
            // Показать экран авторизации через родительский AppCoordinator
            appCoordinator.showAuth()
    }
}

