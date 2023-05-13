//
//  RegistryViewController.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 11.05.2023.
//

import UIKit

class RegistryViewController: UIViewController {

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    // MARK: Setup UI
    private func setupUI() {
        self.view.backgroundColor = .background
        
        navigationController?.navigationBar.prefersLargeTitles = true
        let largeTitleTextAttr = [
            NSAttributedString.Key.foregroundColor: UIColor(red: 0.11, green: 0.21, blue: 0.34, alpha: 1.00),
            NSAttributedString.Key.font: UIFont(name: FontNames.exoSemiBold.rawValue, size: 42)
        ]
        navigationController?.navigationBar.largeTitleTextAttributes = largeTitleTextAttr as [NSAttributedString.Key : Any]
        title = "Create account"
    }
}
