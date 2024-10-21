//
//  RecoveryPasswordVC.swift
//  swift-firebase-auth
//
//  Created by Edson Brandon on 21/10/24.
//

import UIKit

class RecoveryPasswordVC: UIViewController, RecoveryPasswordScreenDelegate {
    
    func didTapSendMailButton() {
        print("tapped")
    }
    
    
    var screen : RecoveryPasswordScreen?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.screen = RecoveryPasswordScreen()
        self.view = self.screen
        
        screen?.delegate = self
        
    }
    
}
