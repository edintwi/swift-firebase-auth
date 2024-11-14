//
//  LoginVC.swift
//  swift-firebase-auth
//
//  Created by Edson Brandon on 14/10/24.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {

    var screen: LoginScreen?
    
    override func loadView() {
        self.screen = LoginScreen()
        self.view = self.screen
        screen?.delegate = self
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension LoginVC: LoginScreenDelegate {
    func didTapForgotPasswordButton() {
        let RecoveryPasswordVC = RecoveryPasswordVC()
        
        navigationController?.pushViewController(RecoveryPasswordVC, animated: true)
    }
    
    func didTapSignUpButton() {
        let signUpVC = SignUpVC()
        
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    func didTapSignInButton(userSignInRequest: SignInUserRequest) {
       
        // Email check
        if !Validator.isValidEmail(for: userSignInRequest.email) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        
        AuthService.shared.signInUser(with: userSignInRequest, completion: {
            error in
            if let error = error {
                AlertManager.showSignInErrorAlert(on: self, with: error)
                return
            }
            
            if let sceneDelegate = self.view.window?.windowScene?.delegate as?  SceneDelegate {
                sceneDelegate.checkAuthentication()
            } else {
                AlertManager.showRegistrationUnknowErrorAlert(on: self)
            }
        }
            
        )
    }
}
