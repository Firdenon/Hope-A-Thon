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
    
    // MARK: - Variables
    var itemIndex: Int = 0
    var image: UIImage = UIImage() {
        didSet{
            if let imageView = urgentImage{
                imageView.image = image
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        urgentImage.image = image
        urgentImage.layer.borderWidth = 0.5
        urgentImage.layer.cornerRadius = 14
    }
}
