//
//  Extensions.swift
//  Hope-A-Thon
//
//  Created by Cifran on 04/09/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

extension UIButton
{
    /*
     Add right arrow disclosure indicator to the button with normal and
     highlighted colors for the title text and the image
     */
    func disclosureButton(baseColor:UIColor)
    {
        self.setTitleColor(baseColor, for: .normal)
        self.setTitleColor(baseColor.withAlphaComponent(0.3), for: .highlighted)
        
        guard let image = UIImage(named: "disclosureIcon")?.withRenderingMode(.alwaysTemplate) else
        {
            return
        }
        guard let imageHighlight = UIImage(named: "disclosureIcon")?.withRenderingMode(.alwaysTemplate) else
        {
            return
        }
        
        self.imageView?.contentMode = .scaleAspectFit
        
        self.setImage(image, for: .normal)
        self.setImage(imageHighlight, for: .highlighted)
        self.imageEdgeInsets = UIEdgeInsetsMake(0, self.bounds.size.width-image.size.width*1.5, 0, 0);
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.contentEdgeInsets = UIEdgeInsetsMake(10,0,10,0)
    }
    
}
