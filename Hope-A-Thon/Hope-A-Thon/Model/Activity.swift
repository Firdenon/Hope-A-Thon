//
//  Activity.swift
//  Hope-A-Thon
//
//  Created by Ferlix Yanto Wang on 03/09/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import Foundation

class Activity: NSObject {
    var title: String = ""
    var date: String = ""
    var location: String = ""
    var ngo: String = ""
    var image: String = ""
    
    override init(){
    }
    
    init(title: String, date: String, location: String, ngo: String, image: String) {
        self.title = title
        self.date = date
        self.location = location
        self.ngo = ngo
        self.image = image
    }
}
