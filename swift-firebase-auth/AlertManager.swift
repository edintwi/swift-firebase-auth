//
//  AlertManager.swift
//  swift-firebase-auth
//
//  Created by Edson Brandon on 14/11/24.
//

import UIKit

class AlertManager {
    private static func showBasicAlert(on vc: UIViewController, with title: String, and message: String?) {
       
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            vc.present(alert, animated: true)
        }
    }
}

//- MARK: - Show validation alerts

extension AlertManager {
    
    public static func showInvalidEmailAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, with: "Invalid e-mail", and: "Please enter a valid email address.")
    }
    
    public static func showInvalidPasswordAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, with: "Invalid password", and: "Please enter a valid password.")
    }
    
    public static func showInvalidUsernameAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, with: "Invalid username", and: "Please enter a valid username.")
    }
}

//- MARK: - Show registration alerts

extension AlertManager {
    
    public static func showRegistrationUnknowErrorAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, with: "Unknow registration error", and: nil)
    }
    
    public static func showRegistrationErrorAlert(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, with: "Unknow registration error", and: "\(error.localizedDescription)")
    }
}

//- MARK: - Show Login alerts

extension AlertManager {
    
    public static func showSignInUnknowErrorAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, with: "Unknow Singing error", and: nil)
    }
    
    public static func showSignInErrorAlert(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, with: "Unknow signing error", and: "\(error.localizedDescription)")
    }
}

//- MARK: - Show Logout alerts

extension AlertManager {
    
    public static func showLogoutError(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, with: "Logout error", and: "\(error.localizedDescription)")
    }
}

//- MARK: - Show Forgout Password alerts

extension AlertManager {
    
    public static func showPasswordResetSend(on vc: UIViewController) {
        self.showBasicAlert(on: vc, with: "Password reset send", and: nil)
    }
    
    public static func showErrorSendingPasswordReset(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, with: "Error sending password reset", and: "\(error.localizedDescription)")
    }
}

//- MARK: - Show Fethcing User alerts

extension AlertManager {
    
        public static func showUserFetchingError(on vc: UIViewController, with error: Error) {
            self.showBasicAlert(on: vc, with: "Error fetching user", and: "\(error.localizedDescription)")
    }
    
    public static func showUnkowFetchingUserError(on vc: UIViewController) {
        self.showBasicAlert(on: vc, with: "Error fetching user", and: "Unknown error")
    }
    
}
