//
//  SignUpViewController.swift
//  Hope-A-Thon
//
//  Created by Cifran on 03/09/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var birthdateTF: UITextField!
    @IBOutlet weak var retypePasswordTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var fullnameTF: UITextField!
    @IBOutlet weak var birthdatePicker: UIDatePicker!
    
    @IBOutlet weak var femaleBtn: UIButton!
    @IBOutlet weak var maleBtn: UIButton!
    
    @IBAction func onTapBirthdateTF(_ sender: Any) {
        isShowingDatePicker = !isShowingDatePicker
        print("CALLED")
    }
    private var isShowingDatePicker: Bool! {
        didSet {
            if isShowingDatePicker {
                UIView.animate(withDuration: 0.3) {
                    self.birthdatePicker.transform = .identity
                }
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.birthdatePicker.transform = .init(translationX: 0, y: self.birthdatePicker.frame.height)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        isShowingDatePicker = false
    }
    
    @IBAction func onTapSignUp(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backToLogin(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension SignUpViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
