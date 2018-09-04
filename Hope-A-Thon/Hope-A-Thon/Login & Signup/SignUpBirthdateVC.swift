//
//  SignUpBirthdateVC.swift
//  Hope-A-Thon
//
//  Created by Cifran on 04/09/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

class SignUpBirthdateVC: BaseSignUpViewController {
    @IBOutlet weak var birthdatePicker: UIDatePicker!
    @IBOutlet weak var birthdateTF: UIButton!
    
    @IBOutlet weak var signInStackView: UIStackView!
    @IBOutlet weak var signInLabel1: UILabel!
    @IBOutlet weak var signInLabel2: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    private var birthDate: Date? {
        didSet {
            let df = DateFormatter()
            df.dateFormat = "MM/dd/yyyy"
            self.birthdateTF.setTitle(df.string(from: self.birthDate!), for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.birthdatePicker.transform = .init(scaleX: 0.01, y: 0.01)
        birthDate = Date()
        
        let tapSignIn = UITapGestureRecognizer(target: self, action: #selector(self.backToSignIn))
        signInStackView.addGestureRecognizer(tapSignIn)
        
        signInLabel1.addCharacterSpacing(kernValue: 2.5)
        signInLabel2.addCharacterSpacing(kernValue: 2.5)
        questionLabel.addCharacterSpacing(kernValue: 2.25)
        
        birthdatePicker.setValue(UIColor.white, forKeyPath: "textColor")
    }
    
    private var pickerIsHidden = false {
        didSet {
            if pickerIsHidden {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                self.birthdatePicker.transform = .identity
                }, completion: nil)
            } else {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                    self.birthdatePicker.transform = .init(scaleX: 0.01, y: 0.01)
                }, completion: nil)
            }
        }
    }

    @IBAction func onTapBirthdate(_ sender: Any) {
        pickerIsHidden = !pickerIsHidden
    }
    
    @IBAction func onChangeBirthdatePicker(_ sender: UIDatePicker) {
        birthDate = sender.date
    }
    
    @IBAction func onTapNextBtn(_ sender: Any) {
        globalUserInfo.birthdate = birthDate
        self.performSegue(withIdentifier: "next", sender: nil)
    }
    
}
