//
//  OnboardingViewController.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 11.05.2023.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {
    
    private let topLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to your"
        label.font = UIFont(name: FontNames.exoSemiBold.rawValue, size: 32)
        label.textColor = UIColor(red: 0.114, green: 0.208, blue: 0.341, alpha: 1)
        return label
    }()
    
    private let botLabel: UILabel = {
        let label = UILabel()
        label.text = "Betting App"
        label.font = UIFont(name: FontNames.exoSemiBold.rawValue, size: 32)
        label.textColor = UIColor(red: 0.114, green: 0.208, blue: 0.341, alpha: 1)
        return label
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log into account", for: .normal)
        button.titleLabel?.font = UIFont(name: FontNames.exoSemiBold.rawValue, size: 16)
        button.setTitleColor(UIColor(red: 0.95, green: 0.98, blue: 0.93, alpha: 1.00), for: .normal)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(red: 0.90, green: 0.22, blue: 0.27, alpha: 1.00)
        return button
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create an account", for: .normal)
        button.titleLabel?.font = UIFont(name: FontNames.exoSemiBold.rawValue, size: 16)
        button.setTitleColor(UIColor(red: 0.11, green: 0.21, blue: 0.34, alpha: 1.00), for: .normal)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor(red: 0.90, green: 0.22, blue: 0.27, alpha: 1.00).cgColor
        button.backgroundColor = .clear
        return button
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupConstraints()
    }

    // MARK: - Setup UI
    private func setupUI() {
        self.view.backgroundColor = UIColor(red: 0.66, green: 0.85, blue: 0.86, alpha: 1.00)
    }
    
    // MARK: - Setup constraints
    private func setupConstraints() {
        view.addSubviews(view: [topLabel, botLabel, loginButton, registerButton])
        
        topLabel.snp.makeConstraints { make in
            make.top.equalTo(233)
            make.centerX.equalToSuperview()
        }
        
        botLabel.snp.makeConstraints { make in
            make.top.equalTo(topLabel).inset(45)
            make.centerX.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints { make in
            make.width.equalTo(335)
            make.height.equalTo(41)
            make.top.equalTo(botLabel).inset(230)
            make.centerX.equalToSuperview()
        }
        
        registerButton.snp.makeConstraints { make in
            make.width.equalTo(335)
            make.height.equalTo(41)
            make.top.equalTo(loginButton).inset(65)
            make.centerX.equalToSuperview()
        }
    }
}

