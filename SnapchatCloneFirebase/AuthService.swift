//
//  AuthService.swift
//  SnapchatCloneFirebase
//
//  Created by YAUHENI IVANIUK on 2/10/17.
//  Copyright © 2017 YauheniIvaniuk. All rights reserved.
//

import Foundation
import FirebaseAuth

typealias Completion = (_ errMsg: String?, _ data: AnyObject?) -> Void

class AuthService {
    private static let _instance = AuthService()
    
    static var instance: AuthService {
        return _instance
    }
    
    func login(email: String, password: String, onComplet: Completion?) {
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            
            if error != nil {
                if let errorCode = FIRAuthErrorCode(rawValue: error!._code) {
                    if errorCode == .errorCodeUserNotFound {
                        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                            if error != nil {
                                self.handleFirebaseError(error: error! as NSError, onComplete: onComplet)
                            } else {
                                if user?.uid != nil {
                                    
                                    DataService.instance.saveUser(uid: user!.uid)
                                    //Sign in
                                    FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                                        if error != nil {
                                            self.handleFirebaseError(error: error! as NSError, onComplete: onComplet)
                                        } else {
                                            onComplet?(nil, user)
                                        }
                                    })
                                }
                            }
                        })
                    }
                } else {
                    //Handle all other errors
                    self.handleFirebaseError(error: error! as NSError, onComplete: onComplet)
                }
            } else {
                //Succesfully logged in
                onComplet?(nil, user)
            }
        })
    }
    
    func handleFirebaseError(error: NSError, onComplete: Completion?) {
        print(error.debugDescription)
        if let errorCode = FIRAuthErrorCode(rawValue: error.code) {
            switch (errorCode) {
            case .errorCodeInvalidEmail:
                onComplete?("Invalid email address", nil)
                break
            case .errorCodeWrongPassword:
                onComplete?("Invalid password", nil)
                break
            case .errorCodeEmailAlreadyInUse, .errorCodeAccountExistsWithDifferentCredential:
                onComplete?("Could not create account. Email already in use", nil)
                break
            default:
                onComplete?("There was a problem authenticating. Try again.", nil)
                
            }
        }
    }
}
