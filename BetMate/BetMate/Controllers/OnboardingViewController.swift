//
//  OnboardingViewController.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 11.05.2023.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {
    
    // MARK: - Private properties
    private let router: MainRouter = Router.shared
    
    private let topLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to your"
        label.font = UIFont(name: FontNames.exoSemiBold.rawValue, size: 32)
        label.textColor = .labelColor
        return label
    }()
    
    private let botLabel: UILabel = {
        let label = UILabel()
        label.text = "Betting App"
        label.font = UIFont(name: FontNames.exoSemiBold.rawValue, size: 32)
        label.textColor = .labelColor
        return label
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log into account", for: .normal)
        button.titleLabel?.font = UIFont(name: FontNames.exoSemiBold.rawValue, size: 16)
        button.setTitleColor(.loginButtonLabelColor, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 10
        button.backgroundColor = .loginButtonColor
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 5
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create an account", for: .normal)
        button.titleLabel?.font = UIFont(name: FontNames.exoSemiBold.rawValue, size: 16)
        button.setTitleColor(.labelColor, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.borderViewColor
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 4
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(registerButtonDidTap), for: .touchUpInside)
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
        self.view.backgroundColor = .background
    }
    
    // MARK: - Selectors
    @objc private func loginButtonDidTap() {
        self.router.showLogin(from: self)
    }
    
    @objc private func registerButtonDidTap() {
        self.router.showRegistry(from: self)
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

