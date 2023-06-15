//
//  AppCoordinator.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 28.05.2023.
//

import Foundation
import FirebaseAuth
import UIKit

class AppCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    var childrenCoordinator: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        print("App Coordinator start")
        
        if Auth.auth().currentUser == nil {
            showAuth()
        } else {
            showTabBar()
        }
//        test()
    }
    
    func showAuth() {
        // For the first time, the app is going to go to Authentication module
        // Create the coordinator
        let authCoordinator = AuthCoordinator.init(navigationController: navigationController)
        // Set the parent
        authCoordinator.parentCoordinator = self
        // Add to AppCoordinator's Child
        childrenCoordinator.append(authCoordinator)
        // Kickstart it.
        authCoordinator.start()
    }
    
    func showTabBar() {
        // Initiate TabBar Coordinator
        let tabBarCoordinator = TabBarCoordinator.init(navigationController: navigationController)
        childrenCoordinator.removeAll()
        tabBarCoordinator.parentCoordinator = self
        tabBarCoordinator.start()
    }
    
//    func test() {
//        // Initiate TabBar Coordinator
//        let vm = DetailGamesViewModel()
//        let vc = DetailGamesViewController(viewModel: vm)
//        navigationController.isNavigationBarHidden = true
//        navigationController.pushViewController(vc, animated: true)
//    }
    
    deinit {
        print("AppCoordinator Deinit")
    }
}
