//
//  SignUpVC.swift
//  swift-firebase-auth
//
//  Created by Edson Brandon on 21/10/24.
//

import UIKit

class SignUpVC: UIViewController {
    var screen : SignUpScreen?
    
    override func loadView() {
        self.screen = SignUpScreen()
        self.view = self.screen
        screen?.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}

extension SignUpVC: SignUpDelegate {
    func didTapSignUpButton(registerUserRequest: RegisterUserRequest) {

        // Username check
        if !Validator.isValidUsername(for: registerUserRequest.userName) {
            AlertManager.showInvalidUsernameAlert(on: self)
            return
        }
        // Email check
        if !Validator.isValidEmail(for: registerUserRequest.email) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        
        // Password check
        if !Validator.isPasswordValid(for: registerUserRequest.password) {
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }

        AuthService.shared.registerUser(with: registerUserRequest) { [weak self] wasRegistered, error in
                   guard let self = self else { return }
                   
                   if let error = error {
                       AlertManager.showRegistrationErrorAlert(on: self, with: error)
                       return
                   }
                   
                   if wasRegistered {
                       if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                           sceneDelegate.checkAuthentication()
                       }
                   } else {
                       AlertManager.showRegistrationUnknowErrorAlert(on: self)
                   }
               }
    }
    
    
}
