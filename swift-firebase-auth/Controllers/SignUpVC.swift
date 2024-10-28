//
//  SignUpVC.swift
//  swift-firebase-auth
//
//  Created by Edson Brandon on 21/10/24.
//

import UIKit

class SignUpVC: UIViewController, SignUpDelegate {
    func didTapSignUpButton(user:   RegisterUserRequest) {
        AuthService.shared.registerUser(with: user, completion: {
            wasRegistred, error in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            
            print(wasRegistred)
        })
    }
    

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
