//
//  DeviderView.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 10.06.2023.
//

import Foundation
import UIKit

class DeviderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupDeviderView()
    }
    
    private func setupDeviderView() {
        backgroundColor = .labelColor
        layer.cornerRadius = 3
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
