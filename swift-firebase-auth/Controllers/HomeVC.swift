//
//  HomeVC.swift
//  swift-firebase-auth
//
//  Created by Edson Brandon on 28/10/24.
//

import UIKit

class HomeVC: UIViewController, HomeScreenDelegate {
    func didTapLogoutButton() {
        AuthService.shared.signOutUser { [weak self] error in
            guard let self = self else {return}
            if let error = error {
                AlertManager.showLogoutError(on: self, with: error)
                return
            }
            
            if let sceneDelegate = self.view.window?.windowScene?.delegate as?
                SceneDelegate {
                sceneDelegate.checkAuthentication()
            }
        }
    }
    

    var screen : HomeScreen?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.screen = HomeScreen()
        self.view = self.screen!
        screen?.delegate = self
    }
}
