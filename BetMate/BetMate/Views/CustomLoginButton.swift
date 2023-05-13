//
//  LoginButton.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 13.05.2023.
//

import UIKit

final class CustomLoginButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLoginButton()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup login button
    private func setupLoginButton() {
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
    }
}
