//
//  AuthNetworkManager.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 15.05.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import GoogleSignIn

class AuthNetworkManager {
    
    static let shared = AuthNetworkManager()
    
    private init() { }
    private let db = Firestore.firestore()
    
    // MARK: - Register new User
    public func registerUser(with userInfo: RegisterUserInfo, completion: @escaping(Bool, Error?) -> Void) {
        let userName = userInfo.userName
        let email = userInfo.email
        let password = userInfo.password
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(false, error)
                return
            }
            
            guard let userResult = result?.user else {
                completion(false, nil)
                return
            }
            
            self.db.collection("users")
                .document(userResult.uid)
                .setData([
                    "username": userName,
                    "email": email
                ]) { error in
                    if let error = error {
                        completion(false, error)
                        return
                    }
                    
                    completion(true, nil)
                }
        }
    }
    
    // MARK: - Login user to account
    public func signInUser(with userInfo: SignInUserInfo, completion: @escaping(Bool, Error?) -> Void) {
        Auth.auth().signIn(withEmail: userInfo.email, password: userInfo.password) { result, error in
            if let error = error {
                completion(false, error)
                return
            } else {
                completion(true, nil)
            }
        }
    }
    
    // MARK: - Sign out user from account
    public func signOutUser(completion: @escaping(Bool, Error?) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true, nil)
        } catch let error {
            completion(false, error)
        }
    }
    
    // MARK: - Reset password
    public func forgotPassword(with email: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            completion(error)
        }
    }
    
    // MARK: - Fetch user info from firebase auth (email/password or google auth)
    func fetchUserInfo(completion: @escaping (User?, Error?) -> Void) {
        guard let user = Auth.auth().currentUser else {
            // User is not auntheficated
            completion(nil, nil)
            return
        }
        
        let userUID = user.uid
        
        if let providerData = user.providerData.first,
           providerData.providerID == GoogleAuthProviderID {
            // Authenfication with google
            let username = user.displayName ?? ""
            let email = user.email ?? ""
            let user = User(userName: username, email: email, userUID: userUID)
            completion(user, nil)
        } else {
            // Authenfication with email and password
            db.collection("users")
                .document(userUID)
                .getDocument { snapshot, error in
                    if let error = error {
                        completion(nil, error)
                        return
                    }
                    
                    if let snapshot = snapshot,
                       let snapshotData = snapshot.data(),
                       let username = snapshotData["username"] as? String,
                       let email = snapshotData["email"] as? String {
                        let user = User(userName: username, email: email, userUID: userUID)
                        completion(user, nil)
                    }
                }
        }
    }
    
}
