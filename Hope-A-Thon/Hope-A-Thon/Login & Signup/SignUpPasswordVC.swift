//
//  SignUpPasswordVC.swift
//  Hope-A-Thon
//
//  Created by Cifran on 04/09/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

class SignUpPasswordVC: BaseSignUpViewController, UITextFieldDelegate {
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var retypePasswordTF: UITextField!
    
    @IBOutlet weak var passwordErrorLabel: UILabel!
    
    @IBOutlet weak var signInStackView: UIStackView!
    @IBOutlet weak var signInLabel1: UILabel!
    @IBOutlet weak var signInLabel2: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordErrorLabel.isHidden = true
        
        passwordTF.delegate = self
        retypePasswordTF.delegate = self
        
        let tapSignIn = UITapGestureRecognizer(target: self, action: #selector(self.backToSignIn))
        signInStackView.addGestureRecognizer(tapSignIn)
        
        signInLabel1.addCharacterSpacing(kernValue: 2.5)
        signInLabel2.addCharacterSpacing(kernValue: 2.5)
        questionLabel.addCharacterSpacing(kernValue: 2.25)
    }
    
    override func userTapOnScreen(_ sender: UITapGestureRecognizer) {
        
        passwordErrorLabel.isHidden = true
        passwordTF.resignFirstResponder()
        retypePasswordTF.resignFirstResponder()
        
        guard let inputPassword = passwordTF.text else {return}
        guard let inputRetypePassword = retypePasswordTF.text else {return}
        if inputPassword == "" {return}
        if inputRetypePassword == "" {return}
        
        if inputPassword != inputRetypePassword {
            passwordErrorLabel.isHidden = false
        } else {
            globalUserInfo.password = inputPassword
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == passwordTF {
            retypePasswordTF.becomeFirstResponder()
        } else {
            retypePasswordTF.resignFirstResponder()
        }
        return true
    }
    
}
