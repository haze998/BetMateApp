//
//  SceneDelegate.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 11.05.2023.
//

import UIKit
import FirebaseAuth
import GoogleSignIn

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        self.setupWindow(with: scene)
//        self.checkUserAuth()
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        let navigationCon = UINavigationController.init()
        self.appCoordinator = AppCoordinator(navigationController: navigationCon)
        appCoordinator?.start()
        window?.rootViewController = navigationCon
        window?.makeKeyAndVisible()
        
        
//        ---
//        guard let scene = (scene as? UIWindowScene) else { return }
//        self.window = UIWindow(windowScene: scene)
//        let builder = Assembly()
//        self.appCoordinator = AppCoordinator(window: window, assemblyBuilder: builder)
//        self.appCoordinator?.start()
//        window?.overrideUserInterfaceStyle = .light
//        window?.makeKeyAndVisible()
    }
    
    // MARK: - Setup window
    private func setupWindow(with scene:UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.makeKeyAndVisible()
    }
    
    // MARK: - Check user authenfication with email / password / google signin
    public func checkUserAuth() {
        if Auth.auth().currentUser == nil {
            let vc = OnboardingViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            self.window?.rootViewController = nav
        } else {
            let vc = TabBarViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            self.window?.rootViewController = nav
        }
    }
}

