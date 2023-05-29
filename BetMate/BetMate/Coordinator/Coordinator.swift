//
//  Coordinator.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 28.05.2023.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get set }
    var childrenCoordinator: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

extension Coordinator {
    /// Removing a coordinator inside a children. This call is important to prevent memory leak.
    /// - Parameter coordinator: Coordinator that finished.
    func childrenDidFinish(_ coordinator: Coordinator) {
        // Call this if a coordinator is done.
        for (index, child) in childrenCoordinator.enumerated() {
            if child === coordinator {
                childrenCoordinator.remove(at: index)
                break
            }
        }
    }
}
