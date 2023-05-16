//
//  TabBarViewController.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 16.05.2023.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabs()
    }
    
    // MARK: - Tab setup
    private func setupTabs() {
        
        self.setViewControllers([], animated: true)
    }
    
    private func creteNav(with title: String, image: UIImage?, viewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: viewController)
        
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        
        return nav
    }
}
