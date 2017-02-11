//
//  LoginVC.swift
//  SnapchatCloneFirebase
//
//  Created by YAUHENI IVANIUK on 2/10/17.
//  Copyright © 2017 YauheniIvaniuk. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailField: RoundTextField!
    @IBOutlet weak var passwordField: RoundTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func logInPressed(_ sender: Any) {
        if let email = emailField.text, let pass = passwordField.text , (email.characters.count > 0 && pass.characters.count > 0) {
            
            AuthService.instance.login(email: email, password: pass, onComplet: { (errMsg, data) in
                guard errMsg == nil else {
                    self.alert(title: "Error Authentication", message: errMsg!)
                    return
                }
                
                self.dismiss(animated: true, completion: nil)
            })
            
        } else {
            alert(title: "Username and Password Required", message: "You mast enter both a username and a password")
        }
    }
    
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }


}
