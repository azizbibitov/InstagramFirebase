//
//  SceneDelegate.swift
//  InstagramFirebasePikir
//
//  Created by Aziz Bibitov on 14.09.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let vc = MainTabBarController()
//            vc.view.backgroundColor = .white
            window.rootViewController = vc
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
