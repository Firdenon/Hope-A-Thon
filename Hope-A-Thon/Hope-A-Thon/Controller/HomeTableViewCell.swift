//
//  HomeTableViewCell.swift
//  Hope-A-Thon
//
//  Created by Ferlix Yanto Wang on 03/09/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var activityImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var ngoLabel: UILabel!
    
//    func setCell(activity: Activity) {
//        titleLabel.text = activity.title
//        dateLabel.text = activity.date
//        locationLabel.text = activity.location
//        ngoLabel.text = activity.ngo
//        activityImage.image = activity.image
//    }
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame =  newFrame
            frame.origin.y += 6
            frame.origin.x += 8
            frame.size.height -= 2 * 4
            frame.size.width -= 2 * 8
            super.frame = frame
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
