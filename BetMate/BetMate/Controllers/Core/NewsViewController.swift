//
//  NewsViewController.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 14.05.2023.
//

import UIKit

class NewsViewController: UIViewController {
    
    // MARK: - Private properties
    private let router: AuthRouter = Router.shared
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sutepUI()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setupConstraints()
    }
    
    // MARK: - SetupUI
    private func sutepUI() {
        self.view.backgroundColor = .background
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutButtonDidTap))
        navigationController?.navigationBar.prefersLargeTitles = true
        let largeTitleTextAttr = [
            NSAttributedString.Key.foregroundColor: UIColor(red: 0.11, green: 0.21, blue: 0.34, alpha: 1.00),
            NSAttributedString.Key.font: UIFont(name: FontNames.exoSemiBold.rawValue, size: 42)
        ]
        navigationController?.navigationBar.largeTitleTextAttributes = largeTitleTextAttr as [NSAttributedString.Key : Any]
        title = "News"
    }
    
    // MARK: - Selectors
    @objc
    private func logoutButtonDidTap() {
        AuthNetworkManager.shared.signOutUser { [weak self] wasLogout, error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showLogoutErrorAlert(on: self, with: error)
                return
            }
            
//            if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
//                sceneDelegate.checkDefaultUserAuth()
//            }
            switch wasLogout {
            case true:
                router.showLogout(from: self)
            case false:
                return
            }
        }
    }
    
    // MARK: - Setup constraints
    private func setupConstraints() {}
}
