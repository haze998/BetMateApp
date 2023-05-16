//
//  GoogleAuthViewModel.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 16.05.2023.
//

import Foundation
import Firebase
import GoogleSignIn

class GoogleAuthViewModel {
        
    func signInWithGoogle(viewController: LoginViewController, completion: @escaping(Bool) -> Void) {
        
        // get app client id
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // get config
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        // Sign in
        GIDSignIn.sharedInstance.signIn(withPresenting: viewController) { result, error in
            if let error = error {
                print(error.localizedDescription)
                completion(false)
                return
            }
            
            guard let user = result?.user,
                  let idToken = user.idToken else { return }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: user.accessToken.tokenString)
            
            Auth.auth().signIn(with: credential) { result, error in
                if let error = error {
                    print(error.localizedDescription)
                    completion(false)
                    return
                }
                
                guard let user = result?.user else { return }
                completion(true)
                print(user)
            }
        }
    }
}
