//
//  LoginViewController.swift
//  HopeAthon
//
//  Created by Cifran on 03/09/18.
//  Copyright © 2018 Cifran. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.userTapOnScreen (_:)))
        self.view.addGestureRecognizer(tapGesture)
        
        emailTF.delegate = self
        passwordTF.delegate = self
        
        emailTF.returnKeyType = .next
        passwordTF.returnKeyType = .send
    }
    
    @objc func userTapOnScreen (_ sender: UITapGestureRecognizer) {
        emailTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTF {
            passwordTF.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            signIn(nil)
        }
        return true
    }
    
    @IBAction func signIn(_ sender: Any?) {
        self.performSegue(withIdentifier: "next", sender: nil)
    }
}
