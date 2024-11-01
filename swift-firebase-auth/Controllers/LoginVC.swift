//
//  LoginVC.swift
//  swift-firebase-auth
//
//  Created by Edson Brandon on 14/10/24.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController, LoginScreenDelegate {

    var screen: LoginScreen?
    
    override func loadView() {
        self.screen = LoginScreen()
        self.view = self.screen
        screen?.delegate = self
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func didTapForgotPasswordButton() {
        let RecoveryPasswordVC = RecoveryPasswordVC()
        
        navigationController?.pushViewController(RecoveryPasswordVC, animated: true)
    }
    
    func didTapSignUpButton() {
        let signUpVC = SignUpVC()
        
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    func didTapSignInButton(credentials: SignInUserRequest) {
        print("tapped")
    }
    
}
