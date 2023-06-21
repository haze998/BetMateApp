//
//  CustomSocialsButton.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 13.05.2023.
//

import UIKit

final class CustomSocialsButton: UIButton {
    
    enum SocialsType {
        case google
        case facebook
        case apple
    }
    
    // MARK: - Private properties
    private let typeOfSocials: SocialsType
    
    init(typeOfSocials: SocialsType) {
        self.typeOfSocials = typeOfSocials
        super.init(frame: .zero)
        
        setupSocialsButton()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func setupSocialsButton() {
        layer.cornerRadius = 10
        backgroundColor = .lightBackgroundView
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 4)
        
        switch typeOfSocials {
        case .google:
            setImage(UIImage(named: ImageNames.google.rawValue), for: .normal)
        case .facebook:
            setImage(UIImage(named: ImageNames.facebook.rawValue), for: .normal)
        case .apple:
            setImage(UIImage(named: ImageNames.apple.rawValue), for: .normal)
        }
    }
}
