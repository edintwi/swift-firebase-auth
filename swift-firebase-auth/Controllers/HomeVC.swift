//
//  HomeVC.swift
//  swift-firebase-auth
//
//  Created by Edson Brandon on 28/10/24.
//

import UIKit

class HomeVC: UIViewController, HomeScreenDelegate {
    func didTapLogoutButton() {
        AuthService.shared.signOutUser(completion: ({error in
            if let error {
                print("failed")
            } else {
                print("logout")
            }
        }))
    }
    

    var screen : HomeScreen?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.screen = HomeScreen()
        self.view = self.screen!
        screen?.delegate = self
    }
}
