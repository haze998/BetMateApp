//
//  MainRouter.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 11.05.2023.
//

import Foundation
import UIKit

protocol MainRouter {
    func showLogin(from viewController: UIViewController)
    func showRegistry(from viewController: UIViewController)
    func showForgotPass(from viewController: UIViewController)
}

extension Router: MainRouter {
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
    
    
}
