//
//  SignUpFullNameVC.swift
//  Hope-A-Thon
//
//  Created by Cifran on 04/09/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

class SignUpFullNameVC: BaseSignUpViewController, UITextFieldDelegate {
    
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var firstNameTF: UITextField!
    
    @IBOutlet weak var signInStackView: UIStackView!
    @IBOutlet weak var signInLabel1: UILabel!
    @IBOutlet weak var signInLabel2: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameTF.delegate = self
        lastNameTF.delegate = self
        
        let tapSignIn = UITapGestureRecognizer(target: self, action: #selector(self.backToSignIn))
        signInStackView.addGestureRecognizer(tapSignIn)
        
        signInLabel1.addCharacterSpacing(kernValue: 2.5)
        signInLabel2.addCharacterSpacing(kernValue: 2.5)
        questionLabel.addCharacterSpacing(kernValue: 2.25)
    }
    
    override func userTapOnScreen (_ sender: UITapGestureRecognizer) {
        firstNameTF.resignFirstResponder()
        lastNameTF.resignFirstResponder()
        
        globalUserInfo.firstName = firstNameTF.text
        globalUserInfo.lastName = lastNameTF.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstNameTF {
            lastNameTF.becomeFirstResponder()
        } else {
            lastNameTF.resignFirstResponder()
            delegate?.goNext()
        }
        return true
    }
    
}
