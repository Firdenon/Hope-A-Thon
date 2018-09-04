//
//  SignUpFullNameVC.swift
//  Hope-A-Thon
//
//  Created by Cifran on 04/09/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

class SignUpFullNameVC: BaseSignUpViewController {
    @IBOutlet weak var fullnameTF: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullnameTF.becomeFirstResponder()
        nextBtn.isHidden = true
    }
    
    override func userTapOnScreen (_ sender: UITapGestureRecognizer) {
        nextBtn.isHidden = true
        fullnameTF.resignFirstResponder()
        
        guard let inputFullname = fullnameTF.text else {return}
        if inputFullname == "" {return}
        
        globalUserInfo.fullname = inputFullname
        nextBtn.isHidden = false
    }
    
    @IBAction func onTapNextBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "next", sender: nil)
    }
    
}
