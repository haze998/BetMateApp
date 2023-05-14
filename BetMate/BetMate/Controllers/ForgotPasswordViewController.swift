//
//  ForgotPasswordViewController.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 11.05.2023.
//

import UIKit
import SnapKit

class ForgotPasswordViewController: UIViewController {
    
    // MARK: - Private properties
    private let emailtextField = CustomTextField(fieldType: .email)
    private let customResetButton = CustomActionButton(actionButtonType: .reset)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setupConstraints()
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
        title = "Forgot password"
    }
    
    // MARK: - Setup constraints
    private func setupConstraints() {
        view.addSubviews(view: [emailtextField, customResetButton])
        
        emailtextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(55)
            make.top.equalTo(191)
            make.centerX.equalToSuperview()
        }
        
        customResetButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(47)
            make.top.equalTo(emailtextField.snp.bottom).offset(40)
        }
    }
}
