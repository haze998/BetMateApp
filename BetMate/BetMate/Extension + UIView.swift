//
//  Extension + UIView.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 11.05.2023.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(view: [UIView]) {
        view.forEach { view in
            addSubview(view)
        }
    }
}
