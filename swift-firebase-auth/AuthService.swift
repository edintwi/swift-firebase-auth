//
//  AuthService.swift
//  swift-firebase-auth
//
//  Created by Edson Brandon on 16/10/24.
//

import Foundation
import FirebaseAuth
 
class AuthService {
     public static let shared = AuthService()
    
    private init(){
        
    }
    
    public func signInUser(with userRequest: SignInUserRequest, completion: @escaping (Bool, Error?) -> Void){
        Auth.auth().signIn(withEmail: userRequest.email, password: userRequest.password){ [weak self] authResult, error in guard self != nil else {return}
                if let error = error{
                completion(false, error)
                return
            }
            
            if authResult != nil{
                completion(true, nil)
            } else {
                completion(false, nil)
            }
            
        }
        
    }
    
}
