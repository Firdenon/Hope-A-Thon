//
//  SignUpEmailVC.swift
//  Hope-A-Thon
//
//  Created by Cifran on 04/09/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

class SignUpEmailVC: BaseSignUpViewController {

    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var emailTF: UITextField!
    
    override func viewDidLoad() {
        emailTF.becomeFirstResponder()
        super.viewDidLoad()
        nextBtn.isHidden = true
    }

    override func userTapOnScreen(_ sender: UITapGestureRecognizer) {
        nextBtn.isHidden = true
        emailTF.resignFirstResponder()
        
        guard let inputEmail = emailTF.text else {return}
        if inputEmail == "" {return}
        
        globalUserInfo.email = inputEmail
        nextBtn.isHidden = false
    }
    
    @IBAction func onTapNextBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "next", sender: nil)
    }
}
