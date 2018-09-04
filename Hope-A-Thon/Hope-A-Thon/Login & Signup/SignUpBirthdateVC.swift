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
    @IBOutlet weak var birthdateTF: UITextField!
    
    private var birthDate: Date? {
        didSet {
            let df = DateFormatter()
            df.dateFormat = "d MMMM yyyy"
            self.birthdateTF.text = df.string(from: birthDate!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onChangeBirthdatePicker(_ sender: UIDatePicker) {
        birthDate = sender.date
    }
    
    @IBAction func onTapNextBtn(_ sender: Any) {
        globalUserInfo.birthdate = birthDate
        self.performSegue(withIdentifier: "next", sender: nil)
    }
    
}
