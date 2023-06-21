//
//  TabBarCoordinator.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 29.05.2023.
//

import Foundation
import UIKit

class TabBarCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    var childrenCoordinator: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        print("Tabbar Coordinator Init")
        initializeTabBar()
    }
    
    deinit {
        print("Tabbar Coordinator Deinit")
    }
    
    func initializeTabBar() {
        let vc = UITabBarController.init()
        vc.tabBar.tintColor = .loginButtonColor
        vc.tabBar.backgroundColor = .white
        vc.tabBar.unselectedItemTintColor = .labelColor
        let tabBarAttr: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: FontNames.exoSemiBold.rawValue, size: 12) ?? ""
        ]
        UITabBarItem.appearance().setTitleTextAttributes(tabBarAttr, for: .normal)
        // Instantiate all related coordinators and views also dependecies like VM or API Services.
        // We want each section has their own navigation controller, rather than app wide view controller.
        let newsNavigationController = UINavigationController()
        let newsCoordinator = NewsCoordinator.init(navigationController: newsNavigationController)
        // we want to home coordinator connected to the App Coordinator, because the HomeTabbar coordinator only serves as a container.
        newsCoordinator.parentCoordinator = parentCoordinator
        
        // Create the tabbar item for tabbar.
        let newsItem = UITabBarItem()
        newsItem.title = "News"
        newsItem.image = UIImage.init(named: ImageNames.flame.rawValue)
        newsNavigationController.tabBarItem = newsItem
        
        // Setup for profile tab
        let gamesNavigationController = UINavigationController()
        let gamesCoordinator = GamesCoordinator.init(navigationController: gamesNavigationController)
        gamesCoordinator.parentCoordinator = parentCoordinator
        
        let gamesItem = UITabBarItem()
        gamesItem.title = "Games"
        gamesItem.image = UIImage.init(named: ImageNames.gamepad.rawValue)
        gamesNavigationController.tabBarItem = gamesItem
        
        // Setup for history tab
        let profileNavigationController = UINavigationController()
        let profileCoordinator = ProfileCoordinator.init(navigationController: profileNavigationController)
        profileCoordinator.parentCoordinator = parentCoordinator
        
        let profileItem = UITabBarItem()
        profileItem.title = "Profile"
        profileItem.image = UIImage.init(named: ImageNames.profile.rawValue)
        profileNavigationController.tabBarItem = profileItem
        
        vc.viewControllers = [newsNavigationController, gamesNavigationController, profileNavigationController]
        navigationController.pushViewController(vc, animated: false)
        navigationController.setNavigationBarHidden(true, animated: true)
        
        // Add the coordinator into parent's child
        parentCoordinator?.childrenCoordinator.append(newsCoordinator)
        parentCoordinator?.childrenCoordinator.append(gamesCoordinator)
        parentCoordinator?.childrenCoordinator.append(profileCoordinator)
        
        newsCoordinator.start()
        gamesCoordinator.start()
        profileCoordinator.start()
    }
}
