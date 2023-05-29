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

        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        let navigationCon = UINavigationController.init()
        self.appCoordinator = AppCoordinator(navigationController: navigationCon)
        appCoordinator?.start()
        window?.rootViewController = navigationCon
        window?.makeKeyAndVisible()
    }
}

