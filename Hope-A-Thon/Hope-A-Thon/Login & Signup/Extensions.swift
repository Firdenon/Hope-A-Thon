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
//        self.setTitleColor(baseColor.withAlphaComponent(0.3), for: .highlighted)
        
        let iconImage = resizeImage(image: UIImage(named: "disclosureIcon")!, targetSize: CGSize(width: 15, height: 15))
        
        let image = iconImage.withRenderingMode(.alwaysTemplate)
//        let imageHighlight = iconImage.withRenderingMode(.alwaysTemplate)
        
        self.imageView?.contentMode = .scaleAspectFit
        
        self.setImage(image, for: .normal)
//        self.setImage(imageHighlight, for: .highlighted)
        self.imageEdgeInsets = UIEdgeInsetsMake(0, self.bounds.size.width-image.size.width*1.5, 0, 0);
        self.backgroundColor = .white
//        self.layer.borderWidth = 0.5
//        self.layer.borderColor = UIColor.darkGray.cgColor
        self.contentEdgeInsets = UIEdgeInsetsMake(10,0,10,0)
    }
    
}

func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
    let size = image.size
    
    let widthRatio  = targetSize.width  / size.width
    let heightRatio = targetSize.height / size.height
    
    // Figure out what our orientation is, and use that to form the rectangle
    var newSize: CGSize
    if(widthRatio > heightRatio) {
        newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
    } else {
        newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
    }
    
    // This is the rect that we've calculated out and this is what is actually used below
    let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
    
    // Actually do the resizing to the rect using the ImageContext stuff
    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
    image.draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage!
}

