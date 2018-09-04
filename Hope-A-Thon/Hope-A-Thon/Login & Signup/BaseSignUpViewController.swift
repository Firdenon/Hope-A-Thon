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
        
//        let signInButton = UIBarButtonItem(title: "Already have an account?", style: .plain, target: self, action: #selector(backToSignIn))
//        signInButton.setTitleTextAttributes([
//            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12),
//            ], for: .normal)
//        setToolbarItems([
//            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
//            signInButton,
//            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//        ], animated: true)
        
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.userTapOnScreen (_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func userTapOnScreen (_ sender: UITapGestureRecognizer) {
        
    }

    @objc func backToSignIn() {
        if globalUserInfo.isBeingFilled() {
            let alert = UIAlertController(title: "Already have an account?", message: nil, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Log In", style: .destructive, handler: { (_) in
                self.dismiss(animated: true, completion: nil)
            }))
            alert.addAction(UIAlertAction(title: "Continue Signing Up", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
