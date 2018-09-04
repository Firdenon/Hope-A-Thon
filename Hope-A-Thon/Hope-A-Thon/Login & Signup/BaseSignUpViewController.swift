//
//  BaseSignUpViewController.swift
//  Hope-A-Thon
//
//  Created by Cifran on 04/09/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

class BaseSignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let signInButton = UIBarButtonItem(title: "Already have an account?", style: .plain, target: self, action: #selector(backToSignIn))
        signInButton.setTitleTextAttributes([
                NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12),
            ], for: .normal)
        
        self.navigationController!.toolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            signInButton,
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        ]
    }

    @objc func backToSignIn() {
        self.dismiss(animated: true, completion: nil)
    }
}
