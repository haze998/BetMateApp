//
//  Validator.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 15.05.2023.
//

import Foundation

class Validator {
    
    static func isValidEmail(email: String) -> Bool {
        let email = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: email)
    }
    
    static func isValidUserName(userName: String) -> Bool {
        let userName = userName.trimmingCharacters(in: .whitespacesAndNewlines)
        let userNameRegEx = "\\w{4,24}"
        let userNamePredicate = NSPredicate(format: "SELF MATCHES %@", userNameRegEx )
        return userNamePredicate.evaluate(with: userName)
    }
    
    static func isPasswordValid(for password: String) -> Bool {
        let password = password.trimmingCharacters(in: .whitespacesAndNewlines)
        let passwordRegEx = "[A-Za-z0-9.-_@#$!%&*]{6,15}$"
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordPred.evaluate(with: password)
    }
}
