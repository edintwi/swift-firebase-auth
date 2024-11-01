//
//  SceneDelegate.swift
//  swift-firebase-auth
//
//  Created by Edson Brandon on 14/10/24.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.setupWindow(with: scene)
        self.checkAuthentication()
        
        let window = UIWindow(windowScene: windowScene)
        
    }
    
    private func setupWindow(with scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene:  windowScene)
        
        self.window = window
        self.window?.makeKeyAndVisible()
    }
    
    public func checkAuthentication() {
        if Auth.auth().currentUser == nil {
            let viewController = LoginVC()
            let navigation = UINavigationController(rootViewController: viewController)
            
            window?.rootViewController = navigation
        } else {
            let viewController = HomeVC()
            let navigation = UINavigationController(rootViewController: viewController)
            
            window?.rootViewController = navigation
        }
    }
    
}
