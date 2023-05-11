//
//  CustomTextField.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 11.05.2023.
//

import Foundation
import UIKit

class CustomTextField: UITextField {
    
    enum TextFieldType {
        case username
        case email
        case password
    }
    
    private let fieldType: TextFieldType
    
    init(fieldType: TextFieldType) {
        self.fieldType = fieldType
        super .init(frame: .zero)
        
        setupUI()
    }
    
    private func setupUI() {
        backgroundColor = .lightBackgroundView
        layer.cornerRadius = 10
        tintColor = UIColor(red: 0.90, green: 0.22, blue: 0.27, alpha: 1.00)
        font = UIFont(name: FontNames.exoSemiBold.rawValue, size: 16)
        returnKeyType = .done
        autocorrectionType = .no
        autocapitalizationType = .none

        leftViewMode = .always
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: frame.size.height))
        
        switch fieldType {
        case .username:
            let placeholderAttrs = [NSAttributedString.Key.font: UIFont(name: FontNames.exoSemiBold.rawValue, size: 16)]
            let attrPlaceholder = NSAttributedString(string: "Username", attributes: placeholderAttrs as [NSAttributedString.Key : Any])
            attributedPlaceholder = attrPlaceholder
            
        case .email:
            let placeholderAttrs = [
                NSAttributedString.Key.font: UIFont(name: FontNames.exoSemiBold.rawValue, size: 16),
                NSAttributedString.Key.foregroundColor: UIColor.labelColor
            ]
            let attrPlaceholder = NSAttributedString(string: "Email", attributes: placeholderAttrs as [NSAttributedString.Key : Any])
            attributedPlaceholder = attrPlaceholder
            keyboardType = .emailAddress
            textContentType = .emailAddress
        case .password:
            let passImageView = UIImageView(image: UIImage(named: "carbon_password"))
            passImageView.frame = CGRect(x: 0, y: 0, width: 24, height: frame.size.height)
//            passImageView.contentMode = .scaleAspectFit
//            let passImageContainer = UIView(frame: CGRect(x: 0, y: 0, width: 34, height: 24))
//            passImageView.frame = passImageContainer.frame.inset(by: UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0))
//            passImageContainer.addSubview(passImageView)
//            let leftInset: CGFloat = 10
//            let imageSize = passImageView.image?.size ?? CGSize.zero
//            let imageFrame = CGRect(x: 0, y: 0, width: imageSize.width + leftInset, height: imageSize.height)
//            leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: frame.size.height))
            leftView = passImageView
//            passImageView.frame = imageFrame
            leftViewMode = .always
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
