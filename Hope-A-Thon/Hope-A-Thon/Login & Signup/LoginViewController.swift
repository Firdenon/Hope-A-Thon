//
//  LoginViewController.swift
//  HopeAthon
//
//  Created by Cifran on 03/09/18.
//  Copyright © 2018 Cifran. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var signUpLabel2: UILabel!
    @IBOutlet weak var signUpLabel1: UILabel!
    @IBOutlet weak var signUpStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.userTapOnScreen (_:)))
        self.view.addGestureRecognizer(tapGesture)
        
        emailTF.delegate = self
        passwordTF.delegate = self
        passwordTF.returnKeyType = .send
        
        let tapSignUp = UITapGestureRecognizer(target: self, action: #selector(self.userTapSignUp (_:)))
        signUpStackView.addGestureRecognizer(tapSignUp)
        
        signUpLabel1.addCharacterSpacing(kernValue: 2.5)
        signUpLabel2.addCharacterSpacing(kernValue: 2.5)
    }
    
    @objc func userTapSignUp(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "signUp", sender: nil)
    }
    
    @objc func userTapOnScreen (_ sender: UITapGestureRecognizer) {
        emailTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTF {
            passwordTF.becomeFirstResponder()
        } else {
            passwordTF.resignFirstResponder()
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (_) in
                if self.passwordTF.text == "" {
                    let alert = UIAlertController(title: nil, message: "Please fill the blank fields", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
                        alert.dismiss(animated: true, completion: nil)
                    }))
                    self.present(alert, animated: true, completion: nil)
                    return
                }
                self.performSegue(withIdentifier: "next", sender: nil)
            }
        }
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setKeyboardListeners()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        removeKeyboardListeners()
    }
    
    // MARK: KEYBOARD EVENTS
    
    private var keyboardHeight: CGFloat = 0
    
    private lazy var viewYWhenKeyboardAppear: CGFloat! = {
        self.view.frame.origin.y - (self.keyboardHeight - 20)
    } ()
    private lazy var viewYWhenKeyboardDisappear: CGFloat! = {
        self.view.frame.origin.y + (self.keyboardHeight - 20)
    } ()
    
    @objc func keyboardWillAppear(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            self.keyboardHeight = keyboardSize.height - (UIApplication.shared.keyWindow?.safeAreaInsets.bottom)!
            UIView.animate(withDuration: 0.3) {
                self.view.frame = CGRect(x: self.view.frame.origin.x, y: self.viewYWhenKeyboardAppear, width: self.view.frame.width, height: self.view.frame.height)
            }
        }
    }
    
    @objc func keyboardWillDisappear(notification: NSNotification) {
        UIView.animate(withDuration: 0.3) {
            self.view.frame = CGRect(x: self.view.frame.origin.x, y: self.viewYWhenKeyboardDisappear, width: self.view.frame.width, height: self.view.frame.height)
        }
    }
    
    @objc func resignTextView() {
        emailTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
    }
    
    private func setKeyboardListeners() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(resignTextView))
        self.view.addGestureRecognizer(tap)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear(notification:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear(notification:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    private func removeKeyboardListeners() {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
    }
}
