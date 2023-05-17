//
//  AlertManager.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 15.05.2023.
//

import Foundation
import UIKit

class AlertManager {
    private static func showAlert(on vc: UIViewController, with title: String, message: String?) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
            vc.present(alert, animated: true)
        }
    }
}

// MARK: - Invalid alerts
extension AlertManager {
    public static func preventInvalidEmail(on vc: UIViewController) {
        showAlert(on: vc, with: "Invalid email", message: "Please, enter valid email and try again.")
    }
    
    public static func preventInvalidPassword(on vc: UIViewController) {
        showAlert(on: vc, with: "Invalid password", message: "Please, enter valid passsword and try again.")
    }
    
    public static func preventInvaliUserName(on vc: UIViewController) {
        showAlert(on: vc, with: "Invalid username", message: "Please, enter valid username and try again.")
    }
}

// MARK: Registration ERROR alerts
extension AlertManager {
    public static func showRegistrationErrorAlert(on vc: UIViewController) {
        showAlert(on: vc, with: "Opps, unknow error...", message: nil)
    }
    
    public static func showRegistrationErrorAlert(on vc: UIViewController, with error: Error) {
        showAlert(on: vc, with: "Opps, registration error", message: "\(error.localizedDescription)")
    }
}

// MARK: Login errors
extension AlertManager {
    public static func showSignInErrorAlert(on vc: UIViewController) {
        showAlert(on: vc, with: "Opps, unknow Signing In error", message: nil)
    }
    
    public static func showSignInErrorAlert(on vc: UIViewController, with error: Error) {
        showAlert(on: vc, with: "Opps, Signing In error", message: "\(error.localizedDescription)")
    }
}

// MARK: Logout errors
extension AlertManager {
    public static func showLogoutErrorAlert(on vc: UIViewController, with error: Error) {
        showAlert(on: vc, with: "Opps, Logout error", message: "\(error.localizedDescription)")
    }
}

// MARK: Forgot password
extension AlertManager {
    public static func showPasswordResetAlert(on vc: UIViewController) {
        showAlert(on: vc, with: "Password reset sent", message: nil)
    }
    
    public static func showResetPasswordAlert(on vc: UIViewController, with error: Error) {
        showAlert(on: vc, with: "Error password reset", message: "\(error.localizedDescription)")
    }
}

// MARK: Fetching Users Errors
extension AlertManager {
    public static func showFetchingUserAlert(on vc: UIViewController, with error: Error) {
        showAlert(on: vc, with: "Error fetching user", message: "\(error.localizedDescription)")
    }
    
    public static func showUnknownFetchingUserAlert(on vc: UIViewController, with error: Error) {
        showAlert(on: vc, with: "Unknown error fetching user", message: nil)
    }
}
