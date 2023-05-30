//
//  TabBarViewController.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 16.05.2023.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setupTabs()
//        setupUI()
    }
    
    // MARK: - Setup UI
//    private func setupUI() {
//        self.tabBar.tintColor = .loginButtonColor
//        self.tabBar.backgroundColor = .white
//        self.tabBar.unselectedItemTintColor = .labelColor
//        let tabBarAttr: [NSAttributedString.Key: Any] = [
//            .font: UIFont(name: FontNames.exoSemiBold.rawValue, size: 12) ?? ""
//        ]
//        UITabBarItem.appearance().setTitleTextAttributes(tabBarAttr, for: .normal)
//    }
    
    // MARK: - Tab setup
//    private func setupTabs() {
//
//        let newsVC = createNav(title: "News", image: UIImage(named: "flame"), viewController: NewsViewController())
//        let gamesVC = createNav(title: "Games", image: UIImage(named: "gamepad"), viewController: GamesViewController())
//        let profileVC = createNav(title: "My profile", image: UIImage(named: "user"), viewController: ProfileViewController())
//
//        self.setViewControllers([newsVC, gamesVC, profileVC], animated: true)
//    }
//
//    private func createNav(title: String, image: UIImage?, viewController: UIViewController) -> UINavigationController {
//        let nav = UINavigationController(rootViewController: viewController)
//
//        nav.tabBarItem.title = title
//        nav.tabBarItem.image = image
//
//        return nav
//    }
}
