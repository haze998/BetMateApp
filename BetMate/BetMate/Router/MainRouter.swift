//
//  MainRouter.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 11.05.2023.
//

import Foundation
import UIKit

protocol AuthRouter {
    func showLogout(from viewController: UIViewController)
    func showLogin(from viewController: UIViewController)
    func showRegistry(from viewController: UIViewController)
    func showForgotPass(from viewController: UIViewController)
    func showNews(from viewController: UIViewController)
}

extension Router: AuthRouter {
    func showLogout(from viewController: UIViewController) {
        let vc = OnboardingViewController()
        viewController.navigationController?.setViewControllers([vc], animated: true)
    }
    
    func showLogin(from viewController: UIViewController) {
        let vc = LoginViewController()
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showRegistry(from viewController: UIViewController) {
        let vc = RegistryViewController()
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showForgotPass(from viewController: UIViewController) {
        let vc = ForgotPasswordViewController()
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
    func showNews(from viewController: UIViewController) {
        let vc = NewsViewController()
        // set NewsViewController as root vc with new stack of Nav Controllers
        // the previous stack will be removed.
        viewController.navigationController?.setViewControllers([vc], animated: true)
    }
}
