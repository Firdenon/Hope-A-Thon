//
//  SignUpPasswordVC.swift
//  Hope-A-Thon
//
//  Created by Cifran on 04/09/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

class SignUpPasswordVC: BaseSignUpViewController {
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var retypePasswordTF: UITextField!
    
    @IBOutlet weak var passwordErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTF.becomeFirstResponder()
        passwordTF.returnKeyType = .next
        nextBtn.isHidden = true
        passwordErrorLabel.isHidden = true
    }
    
    override func userTapOnScreen(_ sender: UITapGestureRecognizer) {
        
        nextBtn.isHidden = true
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
            nextBtn.isHidden = false
        }
    }
    
    @IBAction func onTapNextBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "next", sender: nil)
    }
    
}
