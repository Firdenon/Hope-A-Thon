//
//  NotificationTableViewCell.swift
//  HopeAthon
//
//  Created by Cifran on 03/09/18.
//  Copyright © 2018 Cifran. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!
    
    var item: NotificationItem! {
        didSet {
            self.titleLabel.text = item.title
            self.timestampLabel.text = item.timestampInString()
            self.contentImageView.image = item.image
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentImageView.layer.cornerRadius = contentImageView.frame.height / 2
        contentImageView.backgroundColor = UIColor.gray
        contentImageView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
