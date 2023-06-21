//
//  EyeButton.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 13.05.2023.
//

import UIKit
import SnapKit

final class EyeButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupEyeButton()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout subviews
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }
    
    // MARK: - Setup eye button
    private func setupEyeButton() {
        setImage(UIImage(named: ImageNames.eyeSlash.rawValue), for: .normal)
        isEnabled = false
    }
    
    // MARK: - Setup constraints
    private func setupConstraints() {
        snp.makeConstraints { make in
            make.width.height.equalTo(30)
        }
    }
}
