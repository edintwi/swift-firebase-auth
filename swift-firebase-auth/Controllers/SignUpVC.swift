//
//  SignUpVC.swift
//  swift-firebase-auth
//
//  Created by Edson Brandon on 21/10/24.
//

import UIKit

class SignUpVC: UIViewController, SignUpDelegate {

    var screen : SignUpScreen?
    
    override func loadView() {
        self.screen = SignUpScreen()
        self.view = self.screen
        screen?.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func didTapSignUpButton() {
        print("tapped")
    }

}
