//
//  SignUpGenderVC.swift
//  Hope-A-Thon
//
//  Created by Cifran on 04/09/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

class SignUpGenderVC: BaseSignUpViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func chooseGender(_ sender: UIButton) {
        globalUserInfo.gender = sender.titleLabel?.text == "Male" ? .male : .female
        self.performSegue(withIdentifier: "next", sender: nil)
    }
}
