//
//  AuthService.swift
//  swift-firebase-auth
//
//  Created by Edson Brandon on 16/10/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthService {
     public static let shared = AuthService()
    
    private init(){
        
    }
    
    public func registerUser(with userRequest: RegisterUserRequest, completion:
    @escaping (Bool, Error?) -> Void) {
        
        let userName = userRequest.userName
        let email = userRequest.email
        let password = userRequest.password
        
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if let error {
                completion(false, error)
                return
            }
            
            guard let resultUser = result?.user else {
                completion(false, nil)
                return
            }
            
            let db = Firestore.firestore()
            
            db.collection("users")
                .document(resultUser.uid)
                .setData([
                    "username": userName,
                    "email": email,
                    
                ]) { error in
                    if let error = error {
                        completion(false, error)
                        return
                    }
                    
                    completion(true, nil)
                }

            
        }
    }
    
    
    public func signInUser(with userRequest: SignInUserRequest, completion: @escaping (Error?) -> Void) {
        Auth.auth().signIn(withEmail: userRequest.email, password: userRequest.password)
        {result, error in
            if let error = error {
                completion(error)
                return
            } else {
                completion(nil)
            }
        }
    }
    
    public func signOutUser(completion: @escaping (Error?) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(nil)
        }
        catch let error {
            completion(error)
        }
    }
}
