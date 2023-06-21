//
//  CustomScrollUpButton.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 29.05.2023.
//

import Foundation
import UIKit

class CustomScrollUpButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButton()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup eye button
    private func setupButton() {
        setImage(UIImage(named: ImageNames.scrollup.rawValue), for: .normal)
        backgroundColor = .loginButtonColor
        layer.shadowColor = UIColor(red: 0.902, green: 0.224, blue: 0.275, alpha: 1).cgColor
        layer.shadowRadius = 20
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.cornerRadius = layer.frame.size.width / 2
    }
}
