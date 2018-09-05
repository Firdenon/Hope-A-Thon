//
//  HomeDetailViewController.swift
//  Hope-A-Thon
//
//  Created by Luffandri Luffandri on 05/09/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

class HomeDetailViewController: UIViewController {

    @IBOutlet weak var activityImage: UIImageView!
    @IBOutlet weak var ngoLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var postedLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var desiredLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var termLabel: UILabel!
    @IBOutlet weak var applyButton: UIButton!
    
    @IBOutlet weak var bookmarkButton: UIButton!
    
    @IBOutlet weak var viewAtas: UIView!
    @IBOutlet weak var viewSkill: UIView!
    @IBOutlet weak var viewTerm: UIView!
    @IBOutlet weak var viewDesc: UIView!
    
    var detailActivity: Activity!
    var index: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize.height = 2030
        
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
        
        applyButton.layer.borderWidth = 5
        applyButton.layer.cornerRadius = 8
        applyButton.layer.borderColor = UIColor.clear.cgColor
        
        
        
        activityImage.image = detailActivity.image
        ngoLabel.text = detailActivity.ngo
        locationLabel.text = detailActivity.location
        dateLabel.text = detailActivity.date
        titleLabel.text = detailActivity.title
        
        postedLabel.addCharacterSpacing(kernValue: 2.33)
        locationLabel.addCharacterSpacing(kernValue: 2.33)
        durationLabel.addCharacterSpacing(kernValue: 2.33)
        desiredLabel.addCharacterSpacing(kernValue: 2.33)
        descLabel.addCharacterSpacing(kernValue: 2.33)
        termLabel.addCharacterSpacing(kernValue: 2.33)
        titleLabel.addCharacterSpacing(kernValue: 2.0)
        
        if detailActivity.bookmark == true {
            bookmarkButton.setImage(#imageLiteral(resourceName: "starActive"), for: .normal)
        }
    }
    
    @IBAction func applyButtonPressed() {
        performSegue(withIdentifier: "detailToPost", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PostApplicationViewController {
            destination.detailActivity = detailActivity
        }
    }
    
    @IBAction func bookmarkButtonPressed() {
        
        if nonUrgentActivities[index].bookmark == false {
            nonUrgentActivities[index].bookmark = true
           bookmarkNonUrgentActivities.append(nonUrgentActivities[index])
            bookmarkButton.setImage(#imageLiteral(resourceName: "starActive"), for: .normal)
            
        }
        else{
            nonUrgentActivities[index].bookmark = false
            bookmarkNonUrgentActivities[index].bookmark = false
            bookmarkButton.setImage(#imageLiteral(resourceName: "starNot"), for: .normal)
//            for i in 0...bookmarkUrgentActivities.count-1{
//                if bookmarkUrgentActivities[i].title == urgentActivities[itemIndex].title{
//                    bookmarkUrgentActivities[i].bookmark = false
//                    bookmarkUrgentActivities.remove(at: i)
//                }
//                else{
//                    print("empty")
//                }
//            }
        }
    }
    
}
