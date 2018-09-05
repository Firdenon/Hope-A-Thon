//
//  PostApplicationViewController.swift
//  Hope-A-Thon
//
//  Created by Luffandri Luffandri on 05/09/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

class PostApplicationViewController: UIViewController{

    @IBOutlet weak var resultTextView: UITextView!
    
    @IBOutlet weak var chooseLabel: UILabel!
    @IBOutlet weak var motivationLabel: UILabel!
    
    
    @IBOutlet weak var motivationView: UIView!
    
    
    var detailActivity: Activity!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.4235294118, green: 0.7137254902, blue: 0.8549019608, alpha: 1)
        chooseLabel.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        chooseLabel.addCharacterSpacing(kernValue: 2.33)
        
        motivationView.layer.borderWidth = 0.5
        motivationView.layer.cornerRadius = 10
        motivationView.layer.borderColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        
        motivationLabel.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        motivationLabel.addCharacterSpacing(kernValue: 2.33)

        resultTextView.layer.borderColor = #colorLiteral(red: 0.9058823529, green: 0.8941176471, blue: 0.8941176471, alpha: 1)
        resultTextView.layer.borderWidth = 0.5
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
        resultTextView.resignFirstResponder()
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
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        print("button pressed")
        
        if sender.isSelected{
            sender.isSelected = false
        }else {
            sender.isSelected = true
        }
    }
    
    @IBAction func submitButtonPressed() {
        ongoingActivities.append(detailActivity)
        
        var found = false
        for i in 0...nonUrgentActivities.count-1 {
            if detailActivity.title == nonUrgentActivities[i].title {
                nonUrgentActivities.remove(at: i)
                found = true
                break
            }
        }
        
        if found == false {
            for i in 0...urgentActivities.count-1 {
                if detailActivity.title == urgentActivities[i].title {
                    urgentActivities.remove(at: i)
                    break
                }
            }
        }
        
        for i in 0...bookmarkNonUrgentActivities.count-1{
            if detailActivity.title == bookmarkNonUrgentActivities[i].title {
                bookmarkNonUrgentActivities.remove(at: i)
                found = true
                break
            }
        }
        
        if found == false {
            for i in 0...bookmarkUrgentActivities.count-1{
                if detailActivity.title == bookmarkUrgentActivities[i].title {
                    bookmarkUrgentActivities.remove(at: i)
                    break
                }
            }
        }
        
        ongoingActivities.append(detailActivity)
        self.performSegue(withIdentifier: "unwind", sender: nil)
    }
}
