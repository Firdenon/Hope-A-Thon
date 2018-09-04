//
//  CheckMarkViewCell.swift
//  postView
//
//  Created by Vanessa Wijaya on 03/09/18.
//  Copyright © 2018 Vanessa Wijaya. All rights reserved.
//

import UIKit

class CheckMarkViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var buttonChecked: UIButton!
    
//    
//    @IBAction func buttonPressed(_ sender: Any) {
//        print("button pressed")
//    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
