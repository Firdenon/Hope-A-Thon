//
//  ProfileViewController.swift
//  Hope-A-Thon
//
//  Created by Ricky Adi Kuncoro on 04/09/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//



import UIKit

class ProfileViewController: UIViewController, UINavigationBarDelegate, UITextFieldDelegate {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var genderLabel : UILabel!
    @IBOutlet weak var nationalLabel: UILabel!
    @IBOutlet weak var occupationLabel: UILabel!
    @IBOutlet weak var skillLabel: UILabel!
    @IBOutlet weak var languangeLabel : UILabel!
    @IBOutlet weak var emergencyLabel : UILabel!
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var contactCard: UIView!
    @IBOutlet weak var dobCard: UIView!
    @IBOutlet weak var nationalityCard: UIView!
    @IBOutlet weak var skillCard: UIView!
    @IBOutlet weak var languageCard: UIView!
    @IBOutlet weak var emergencyCard: UIView!
    @IBOutlet weak var insideStack: UIStackView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextfield: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.profileImage.layer.cornerRadius = self.profileImage.frame.size.width / 2
        self.profileImage.clipsToBounds = true
        self.profileImage.layer.borderWidth = CGFloat(3.5)
        self.profileImage.layer.borderColor = UIColor.white.cgColor
        //UIApplication.shared.statusBarStyle = .lightContent
        
        nameTextField.delegate = self
        phoneTextfield.delegate = self
        emailTextField.delegate = self
        dateTextField.delegate = self
        let toolBar = UIToolbar().ToolbarPiker(mySelect: #selector(ProfileViewController.dismissPicker))
        
        dateTextField.inputAccessoryView = toolBar
        
        contactCard.layer.cornerRadius = 10
        contactCard.layer.borderWidth = 1
        contactCard.layer.borderColor = #colorLiteral(red: 0.9058823529, green: 0.8941176471, blue: 0.8941176471, alpha: 1)
        
        dobCard.layer.cornerRadius = 10
        dobCard.layer.borderWidth = 1
        dobCard.layer.borderColor = #colorLiteral(red: 0.9058823529, green: 0.8941176471, blue: 0.8941176471, alpha: 1)
        
        nationalityCard.layer.cornerRadius = 10
        nationalityCard.layer.borderWidth = 1
        nationalityCard.layer.borderColor = #colorLiteral(red: 0.9058823529, green: 0.8941176471, blue: 0.8941176471, alpha: 1)
        
        skillCard.layer.cornerRadius = 10
        skillCard.layer.borderWidth = 1
        skillCard.layer.borderColor = #colorLiteral(red: 0.9058823529, green: 0.8941176471, blue: 0.8941176471, alpha: 1)
        
        languageCard.layer.cornerRadius = 10
        languageCard.layer.borderWidth = 1
        languageCard.layer.borderColor = #colorLiteral(red: 0.9058823529, green: 0.8941176471, blue: 0.8941176471, alpha: 1)
        
        emergencyCard.layer.cornerRadius = 10
        emergencyCard.layer.borderWidth = 1
        emergencyCard.layer.borderColor = #colorLiteral(red: 0.9058823529, green: 0.8941176471, blue: 0.8941176471, alpha: 1)
        
        
        nameLabel.addCharacterSpacing(kernValue: 2.33)
        contactLabel.addCharacterSpacing(kernValue: 2.33)
        dobLabel.addCharacterSpacing(kernValue: 2.33)
        genderLabel.addCharacterSpacing(kernValue: 2.33)
        nationalLabel.addCharacterSpacing(kernValue: 2.33)
        occupationLabel.addCharacterSpacing(kernValue: 2.33)
        skillLabel.addCharacterSpacing(kernValue: 2.33)
        languangeLabel.addCharacterSpacing(kernValue: 2.33)
        emergencyLabel.addCharacterSpacing(kernValue: 2.33)
        
        
        //emergencyCard.bounds = CGRect(x: 10, y: 10, width: 10, height: 10)
        
        
//        insideStack.preservesSuperviewLayoutMargins = true
//        insideStack.isLayoutMarginsRelativeArrangement = true
//        insideStack.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Cancel"
        navigationItem.backBarButtonItem = backItem
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func nameEditBtn(_ sender: Any) {
        nameTextField.isHidden = false
        nameTextField.becomeFirstResponder()
    }
    
    @IBAction func contactEditBtn(_ sender: Any) {
        emailTextField.isHidden = false
        phoneTextfield.isHidden = false
        emailTextField.becomeFirstResponder()
    }
    
    @IBAction func dobEditBtn(_ sender: Any) {
        dateTextField.isHidden = false
        dateTextField.becomeFirstResponder()
    }
    
    @objc func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField.tag == 4 {
            let datePickerView:UIDatePicker = UIDatePicker()
            datePickerView.datePickerMode = UIDatePickerMode.date
            textField.inputView = datePickerView
            datePickerView.addTarget(self, action: #selector(ProfileViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)
            
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 1 {
            nameLabel.text = textField.text
        } else if textField.tag == 2 || textField.tag == 3 {
            if textField.tag == 2 {
                if let nextTag = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
                    nextTag.becomeFirstResponder()
                    emailLabel.text = textField.text
                } else {
                    textField.resignFirstResponder()
                }
            } else if textField.tag == 3 {
                phoneLabel.text = textField.text
            }
        }
        
        textField.resignFirstResponder()
        textField.isHidden = true
        return false
    }
    
    @objc func datePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.medium
        
        dateFormatter.timeStyle = DateFormatter.Style.none
        
        dateTextField.text = dateFormatter.string(from: sender.date)
        
    }
    
    @objc func dismissPicker() {
        view.endEditing(true)
        dateLabel.text = dateTextField.text
        dateTextField.isHidden = true
        
    }

    
}

extension UILabel {
    func addCharactersSpacing(_ value: CGFloat = 1.15) {
        if let textString = text {
            let attrs: [NSAttributedStringKey : Any] = [.kern: value]
            attributedText = NSAttributedString(string: textString, attributes: attrs)
        }
    }
}

extension UIToolbar {
    
    func ToolbarPiker(mySelect : Selector) -> UIToolbar {
        
        let toolBar = UIToolbar()
        
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: mySelect)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([ spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        return toolBar
    }
    
}
