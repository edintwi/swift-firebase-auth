//
//  RecoveryPasswordVC.swift
//  swift-firebase-auth
//
//  Created by Edson Brandon on 21/10/24.
//

import UIKit

class RecoveryPasswordVC: UIViewController {
    
    
    var screen : RecoveryPasswordScreen?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.screen = RecoveryPasswordScreen()
        self.view = self.screen
        
        screen?.delegate = self
        
    }
    
}

extension RecoveryPasswordVC: RecoveryPasswordScreenDelegate {
    func didTapSendMailButton(with email: String) {
       
        // Email check
        if !Validator.isValidEmail(for: email) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        
        AuthService.shared.forgotPassword(with: email) {[weak self] error in
            guard let self = self else {return}
            if let error = error {
                AlertManager.showErrorSendingPasswordReset(on: self, with: error)
                return
            }
            
            AlertManager.showPasswordResetSend(on: self)
        
        }
    }

}
