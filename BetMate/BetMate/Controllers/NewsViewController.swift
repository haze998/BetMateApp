//
//  NewsViewController.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 14.05.2023.
//

import UIKit

class NewsViewController: UIViewController {

    // MARK: - Private properties
    
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
        navigationController?.navigationBar.prefersLargeTitles = true
        let largeTitleTextAttr = [
            NSAttributedString.Key.foregroundColor: UIColor(red: 0.11, green: 0.21, blue: 0.34, alpha: 1.00),
            NSAttributedString.Key.font: UIFont(name: FontNames.exoSemiBold.rawValue, size: 42)
        ]
        navigationController?.navigationBar.largeTitleTextAttributes = largeTitleTextAttr as [NSAttributedString.Key : Any]
        title = "News"
    }
    
    // MARK: - Setup constraints
    private func setupConstraints() {}

}
