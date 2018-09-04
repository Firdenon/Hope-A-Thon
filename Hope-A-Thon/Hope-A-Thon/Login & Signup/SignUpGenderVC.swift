//
//  SignUpGenderVC.swift
//  Hope-A-Thon
//
//  Created by Cifran on 04/09/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

class SignUpGenderVC: BaseSignUpViewController {
    @IBOutlet weak var maleLabel: UILabel!
    @IBOutlet weak var femaleLabel: UILabel!
    
    @IBOutlet weak var signInStackView: UIStackView!
    @IBOutlet weak var signInLabel1: UILabel!
    @IBOutlet weak var signInLabel2: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        let tapSignIn = UITapGestureRecognizer(target: self, action: #selector(self.backToSignIn))
        signInStackView.addGestureRecognizer(tapSignIn)
        
        signInLabel1.addCharacterSpacing(kernValue: 2.5)
        signInLabel2.addCharacterSpacing(kernValue: 2.5)
        questionLabel.addCharacterSpacing(kernValue: 2.25)
        
        maleLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.chooseGender(_ :))))
        maleLabel.isUserInteractionEnabled = true
        femaleLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.chooseGender(_ :))))
        femaleLabel.isUserInteractionEnabled = true
    }
    
    @objc func chooseGender(_ gesture: UITapGestureRecognizer) {
        if gesture.view == maleLabel {
            underline(label: maleLabel, value: 1.5)
            underline(label: femaleLabel, value: 0)
            globalUserInfo.gender = .male
        } else {
            underline(label: maleLabel, value: 0)
            underline(label: femaleLabel, value: 1.5)
            globalUserInfo.gender = .female
        }
    }
    
    func underline(label: UILabel, value: Double) {
        let attrString = NSMutableAttributedString(string: label.text!)
        attrString.addAttribute(NSAttributedStringKey.underlineStyle, value: value, range: NSRange(location: 0, length: attrString.length))
        label.attributedText = attrString
    }
}
