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
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing(_:))))
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
        
        self.performSegue(withIdentifier: "unwind", sender: nil)
    }
}
