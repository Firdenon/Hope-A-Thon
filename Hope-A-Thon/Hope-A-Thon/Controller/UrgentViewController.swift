//
//  UrgentViewController.swift
//  Hope-A-Thon
//
//  Created by Ferlix Yanto Wang on 04/09/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

class UrgentViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var urgentImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ngoLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var bookmarkButton: UIButton!
    
    // MARK: - Variables
    var itemIndex: Int = 0
    var titleActivity = ""
    var location = ""
    var date = ""
    var ngo = ""
    var image: UIImage = UIImage() {
        didSet{
            if let imageView = urgentImage{
                imageView.image = image
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titleActivity
        locationLabel.text = location
        dateLabel.text = date
        ngoLabel.text = ngo
        urgentImage.image = image
        
        titleLabel.addCharacterSpacing(kernValue: 3)
        urgentImage.layer.borderWidth = 0.5
        urgentImage.layer.cornerRadius = 14
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if urgentActivities[itemIndex].bookmark == true{
            bookmarkButton.setImage(#imageLiteral(resourceName: "starActive"), for: .normal)
        }
        else{
            bookmarkButton.setImage(#imageLiteral(resourceName: "starNot"), for: .normal)
        }
        
    }
    
    
    @IBAction func bookmarkButtonPressed() {
        print(itemIndex)
        if urgentActivities[itemIndex].bookmark == false {
            urgentActivities[itemIndex].bookmark = true
        }
        else{
            urgentActivities[self.itemIndex].bookmark = false
            for i in 0...bookmarkUrgentActivities.count-1{
                if bookmarkUrgentActivities[i].title == urgentActivities[itemIndex].title{
                bookmarkUrgentActivities[i].bookmark = false
                bookmarkUrgentActivities.remove(at: i)
            }
                else{
                    print("empty")
                }
            }
        }
    }
    
}
