//
//  SignUpEmailVC.swift
//  Hope-A-Thon
//
//  Created by Cifran on 04/09/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

class SignUpEmailVC: BaseSignUpViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var signInStackView: UIStackView!
    @IBOutlet weak var signInLabel1: UILabel!
    @IBOutlet weak var signInLabel2: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTF.delegate = self
        
        let tapSignIn = UITapGestureRecognizer(target: self, action: #selector(self.backToSignIn))
        signInStackView.addGestureRecognizer(tapSignIn)
        
        signInLabel1.addCharacterSpacing(kernValue: 2.5)
        signInLabel2.addCharacterSpacing(kernValue: 2.5)
        questionLabel.addCharacterSpacing(kernValue: 2.25)
    }
    
    override func userTapOnScreen (_ sender: UITapGestureRecognizer) {
        emailTF.resignFirstResponder()
        globalUserInfo.email = emailTF.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTF.resignFirstResponder()
        delegate?.goNext()
        return true
    }
}
