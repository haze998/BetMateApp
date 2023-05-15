//
//  SceneDelegate.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 11.05.2023.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        self.setupWindow(with: scene)
        self.checkDefaultUserAuth()
    }
    
    // MARK: - Setup window
    private func setupWindow(with scene:UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.makeKeyAndVisible()
    }
    
    // MARK: - Check user authenfication with email / password
    public func checkDefaultUserAuth() {
        if Auth.auth().currentUser == nil {
            let vc = OnboardingViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            self.window?.rootViewController = nav
        } else {
            let vc = NewsViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            self.window?.rootViewController = nav
        }
    }
}

