//
//  HomeVC.swift
//  swift-firebase-auth
//
//  Created by Edson Brandon on 28/10/24.
//

import UIKit

class HomeVC: UIViewController {
    
    private var screen : HomeScreen!
    
    override func loadView() {
        self.screen = HomeScreen()
        self.view = self.screen
        screen?.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AuthService.shared.fetchUser { [weak self] user, error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showUserFetchingError(on: self, with: error)
                return
            }
            
            if let user = user {
                screen.label.text = "\(user.username)\n\(user.email)"
                return
            }
        }
    }
}

extension HomeVC: HomeScreenDelegate {
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
}
