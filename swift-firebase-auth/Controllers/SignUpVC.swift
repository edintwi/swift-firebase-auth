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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
