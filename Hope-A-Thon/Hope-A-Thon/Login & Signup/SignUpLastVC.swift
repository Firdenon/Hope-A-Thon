//
//  SignUpLastVC.swift
//  Hope-A-Thon
//
//  Created by Cifran on 04/09/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

class SignUpLastVC: BaseSignUpViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onTapSignUpBtn(_ sender: Any) {
        debugPrint(globalUserInfo)
        self.dismiss(animated: true, completion: nil)
    }
}
