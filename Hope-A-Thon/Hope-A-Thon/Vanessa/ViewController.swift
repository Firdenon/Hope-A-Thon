//
//  ViewController.swift
//  postView
//
//  Created by Vanessa Wijaya on 03/09/18.
//  Copyright © 2018 Vanessa Wijaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var postedLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var desiredLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var termLabel: UILabel!
    
    
    @IBOutlet weak var viewAtas: UIView!
    @IBOutlet weak var viewSkill: UIView!
    @IBOutlet weak var viewTerm: UIView!
    @IBOutlet weak var viewDesc: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       scrollView.contentSize.height = 2000
        
    navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.4235294118, green: 0.7137254902, blue: 0.8549019608, alpha: 1)
        
    viewAtas.layer.cornerRadius = 10
    viewAtas.layer.borderWidth = 0.5
    viewAtas.layer.borderColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
    
    viewSkill.layer.cornerRadius = 10
    viewSkill.layer.borderWidth = 0.5
    viewSkill.layer.borderColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        
    viewTerm.layer.cornerRadius = 10
    viewTerm.layer.borderWidth = 0.5
    viewTerm.layer.borderColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        
    viewDesc.layer.cornerRadius = 10
    viewDesc.layer.borderWidth = 0.5
    viewDesc.layer.borderColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        
        postedLabel.addCharacterSpacing(kernValue: 2.33)
        locationLabel.addCharacterSpacing(kernValue: 2.33)
        durationLabel.addCharacterSpacing(kernValue: 2.33)
        desiredLabel.addCharacterSpacing(kernValue: 2.33)
        descLabel.addCharacterSpacing(kernValue: 2.33)
        termLabel.addCharacterSpacing(kernValue: 2.33)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

