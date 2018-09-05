//
//  ActivityDetailViewController.swift
//  Hope-A-Thon
//
//  Created by Ferlix Yanto Wang on 05/09/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

class ActivityDetailViewController: UIViewController {

    @IBOutlet weak var activityImage: UIImageView!
    @IBOutlet weak var ngoLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var approvedLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var postedLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var desiredLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var termLabel: UILabel!
    
    @IBOutlet weak var bookmarkButton: UIButton!
    
    @IBOutlet weak var approvedView: UIView!
    @IBOutlet weak var viewAtas: UIView!
    @IBOutlet weak var viewSkill: UIView!
    @IBOutlet weak var viewTerm: UIView!
    @IBOutlet weak var viewDesc: UIView!
    
    var detailActivity: Activity!
    var index: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize.height = 1680
        
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
        
        approvedView.layer.cornerRadius = 10
        approvedView.layer.borderWidth = 0.5
        approvedView.layer.borderColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        
        postedLabel.addCharacterSpacing(kernValue: 2.33)
        locationLabel.addCharacterSpacing(kernValue: 2.33)
        durationLabel.addCharacterSpacing(kernValue: 2.33)
        desiredLabel.addCharacterSpacing(kernValue: 2.33)
        descLabel.addCharacterSpacing(kernValue: 2.33)
        termLabel.addCharacterSpacing(kernValue: 2.33)
        
        approvedLabel.addCharacterSpacing(kernValue: 2.33)
        
        activityImage.image = detailActivity.image
        ngoLabel.text = detailActivity.ngo
        locationLabel.text = detailActivity.location
        dateLabel.text = detailActivity.date
        titleLabel.text = detailActivity.title
        
        titleLabel.addCharacterSpacing(kernValue: 2)
    }
    
    @IBAction func boomarkButtonPressed() {
    }
    
}
