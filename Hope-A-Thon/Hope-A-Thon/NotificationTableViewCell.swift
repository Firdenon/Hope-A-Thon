//
//  NotificationTableViewCell.swift
//  HopeAthon
//
//  Created by Cifran on 03/09/18.
//  Copyright © 2018 Cifran. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!
    
    var item: NotificationItem! {
        didSet {
            self.titleLabel.text = item.title
            self.descLabel.text = item.desc
            self.timestampLabel.text = item.timestampInString()
            self.contentImageView.image = item.image
            
            if item.isNew {
                self.backView.backgroundColor = #colorLiteral(red: 0.3102046847, green: 0.722851932, blue: 0.870384872, alpha: 1)
            } else {
                self.backView.backgroundColor = .white
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentImageView.layer.cornerRadius = contentImageView.frame.height / 2
//        contentImageView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        contentImageView.layer.masksToBounds = true
        contentImageView.layer.borderColor = #colorLiteral(red: 0.3102046847, green: 0.722851932, blue: 0.870384872, alpha: 1)
        contentImageView.layer.borderWidth = 1
        contentImageView.contentMode = .scaleAspectFit
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
