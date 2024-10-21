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
        AuthService.shared.signInUser(with: credentials, completion: {sucess, error in
            if(sucess){
                let alert = UIAlertController(title: "Sucess", message: "You are logged", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
                }))
                
                self.present(alert, animated: true, completion: nil)
                
            }else {
                print("Not")
            }
        })
    }
    
}
