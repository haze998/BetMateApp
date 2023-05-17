//
//  CustomActionButton.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 13.05.2023.
//

import UIKit

final class CustomActionButton: UIButton {
    
    enum ActionButtonType {
        case login
        case registry
        case reset
    }
    
    // MARK: - Private properties
    private let actionButtonType: ActionButtonType
    
    init(actionButtonType: ActionButtonType) {
        self.actionButtonType = actionButtonType
        super.init(frame: .zero)
        
        setupActionButton()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup login button
    private func setupActionButton() {
        setTitle("Login", for: .normal)
        setTitleColor(.loginButtonLabelColor, for: .normal)
        titleLabel?.font = UIFont(name: FontNames.exoSemiBold.rawValue, size: 20)
        backgroundColor = .loginButtonColor
        layer.cornerRadius = 10
        
        // setup shadows
        layer.shadowColor = UIColor(red: 0.902, green: 0.224, blue: 0.275, alpha: 1).cgColor
        layer.shadowRadius = 20
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 0)
        
        switch actionButtonType {
        case .login:
            setTitle("Login", for: .normal)
        case .registry:
            setTitle("Create account", for: .normal)
        case .reset:
            setTitle("Resert password", for: .normal)
        }
    }
}
