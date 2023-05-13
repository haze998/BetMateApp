//
//  LoginViewController.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 11.05.2023.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    private let emailTextField = CustomTextField(fieldType: .email)
    private let passwordtextField = CustomTextField(fieldType: .password)
    
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
        
        navigationController?.navigationBar.prefersLargeTitles = true
        let largeTitleTextAttr = [
            NSAttributedString.Key.foregroundColor: UIColor(red: 0.11, green: 0.21, blue: 0.34, alpha: 1.00),
            NSAttributedString.Key.font: UIFont(name: FontNames.exoSemiBold.rawValue, size: 42)
        ]
        navigationController?.navigationBar.largeTitleTextAttributes = largeTitleTextAttr as [NSAttributedString.Key : Any]
        title = "Login"
    }
    
    // MARK: - Setup constraints
    private func setupConstraints() {
        self.view.addSubviews(view: [emailTextField, passwordtextField])
        
        emailTextField.snp.makeConstraints { make in
            make.width.equalTo(335)
            make.height.equalTo(55)
            make.top.equalTo(191)
            make.centerX.equalToSuperview()
        }
        
        passwordtextField.snp.makeConstraints { make in
            make.width.equalTo(335)
            make.height.equalTo(55)
            make.top.equalTo(emailTextField.snp.bottom).offset(36)
            make.centerX.equalToSuperview()
        }
    }
}
