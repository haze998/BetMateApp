//
//  CustomTextField.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 11.05.2023.
//

import UIKit

final class CustomTextField: UITextField {
    
    // MARK: - TextFieldType
    enum TextFieldType {
        case username
        case email
        case password
    }
    
    // MARK: - Private properties
    private let padding = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 0)
    private let eyePadding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
    private let fieldType: TextFieldType
    
    init(fieldType: TextFieldType) {
        self.fieldType = fieldType
        super .init(frame: .zero)
        
        setupTextField()
    }
    
    // MARK: - Override methods
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        let eyeButtonBounds = CGRect(x: frame.width - (rightView?.frame.width ?? 0), y: frame.height - ((rightView?.frame.height ?? 0) / 0.8), width: 24, height: 24)
        return eyeButtonBounds
    }
    
    // MARK: - Setup custom text field
    private func setupTextField() {
        backgroundColor = .lightBackgroundView
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 15
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 15, height: 15)
        tintColor = UIColor(red: 0.90, green: 0.22, blue: 0.27, alpha: 1.00)
        font = UIFont(name: FontNames.exoSemiBold.rawValue, size: 16)
        returnKeyType = .done
        autocorrectionType = .no
        autocapitalizationType = .none
        
        switch fieldType {
        case .username:
            // setup user image on left side text field
            let userView = UIImageView(frame:
                                        CGRect(x: 10, y: 0, width: 24, height: 24))
            let userImage = UIImage(named: ImageNames.user.rawValue)
            userView.image = userImage
            let userContainerView = UIView(frame:
                                            CGRect(x: 10, y: 0, width: 24, height: 24))
            userContainerView.addSubview(userView)
            leftView = userContainerView
            leftViewMode = .always
            
            // setup placeholder
            let placeholderAttrs = [
                NSAttributedString.Key.font: UIFont(name: FontNames.exoSemiBold.rawValue, size: 16),
                NSAttributedString.Key.foregroundColor: UIColor.labelColor
            ]
            
            let attrPlaceholder = NSAttributedString(string: "Username", attributes: placeholderAttrs as [NSAttributedString.Key : Any])
            attributedPlaceholder = attrPlaceholder
            
        case .email:
            // setup email image on left side text field
            let emailView = UIImageView(frame:
                                            CGRect(x: 10, y: 0, width: 24, height: 24))
            let emailImage = UIImage(named: ImageNames.email.rawValue)
            emailView.image = emailImage
            let emailContainerView = UIView(frame:
                                                CGRect(x: 10, y: 0, width: 24, height: 24))
            emailContainerView.addSubview(emailView)
            leftView = emailContainerView
            leftViewMode = .always
            
            // setup placeholder
            let placeholderAttrs = [
                NSAttributedString.Key.font: UIFont(name: FontNames.exoSemiBold.rawValue, size: 16),
                NSAttributedString.Key.foregroundColor: UIColor.labelColor
            ]
            
            let attrPlaceholder = NSAttributedString(string: "Email", attributes: placeholderAttrs as [NSAttributedString.Key : Any])
            attributedPlaceholder = attrPlaceholder
            keyboardType = .emailAddress
            textContentType = .emailAddress
            
        case .password:
            // setup key image on left side text field
            let passView = UIImageView(frame:
                                        CGRect(x: 10, y: 0, width: 24, height: 24))
            let passImage = UIImage(named: ImageNames.carbonPassword.rawValue)
            passView.image = passImage
            let passContainerView = UIView(frame:
                                            CGRect(x: 10, y: 0, width: 24, height: 24))
            passContainerView.addSubview(passView)
            leftView = passContainerView
            leftViewMode = .always

            // setup placeholder
            let placeholderAttrs = [
                NSAttributedString.Key.font: UIFont(name: FontNames.exoSemiBold.rawValue, size: 16),
                NSAttributedString.Key.foregroundColor: UIColor.labelColor
            ]
            
            let attrPlaceholder = NSAttributedString(string: "Password", attributes: placeholderAttrs as [NSAttributedString.Key : Any])
            attributedPlaceholder = attrPlaceholder
            textContentType = .password
            isSecureTextEntry = true
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
