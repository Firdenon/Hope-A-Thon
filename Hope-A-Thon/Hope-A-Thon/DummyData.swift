//
//  DummyData.swift
//  HopeAthon
//
//  Created by Cifran on 03/09/18.
//  Copyright © 2018 Cifran. All rights reserved.
//

import UIKit

func randomDate() -> Date {
    let days: Int = 60
    let today = Date()
    
    let gregorian = Calendar(identifier: .gregorian)
    
    let r1 = arc4random_uniform(UInt32(days))
    let r2 = arc4random_uniform(UInt32(23))
    let r3 = arc4random_uniform(UInt32(23))
    let r4 = arc4random_uniform(UInt32(23))
    
    var offsetComponents = DateComponents()
    offsetComponents.day = Int(r1) * -1
    offsetComponents.hour = Int(r2)
    offsetComponents.minute = Int(r3)
    offsetComponents.second = Int(r4)
    
    guard let rndDate1 = gregorian.date(byAdding: offsetComponents, to: today) else {
        return Date()
    }
    return rndDate1
}

func randomBool() -> Bool {
    return arc4random_uniform(2) == 1
}

var notificationItems = [
    NotificationItem(title: "Your application has been approved. Please wait to be contacted", timestamp: randomDate(), image: UIImage(named: "notification")!, isNew: randomBool()),
    NotificationItem(title: "Your application has been approved. Please wait to be contacted", timestamp: randomDate(), image: UIImage(named: "notification")!, isNew: randomBool()),
    NotificationItem(title: "Your application has been approved. Please wait to be contacted", timestamp: randomDate(), image: UIImage(named: "notification")!, isNew: randomBool()),
    NotificationItem(title: "Your application has been approved. Please wait to be contacted", timestamp: randomDate(), image: UIImage(named: "notification")!, isNew: randomBool()),
    NotificationItem(title: "Your application has been approved. Please wait to be contacted", timestamp: randomDate(), image: UIImage(named: "notification")!, isNew: randomBool()),
    NotificationItem(title: "Your application has been approved. Please wait to be contacted", timestamp: randomDate(), image: UIImage(named: "notification")!, isNew: randomBool()),
    NotificationItem(title: "Your application has been approved. Please wait to be contacted", timestamp: randomDate(), image: UIImage(named: "notification")!, isNew: randomBool()),
    NotificationItem(title: "Your application has been approved. Please wait to be contacted", timestamp: randomDate(), image: UIImage(named: "notification")!, isNew: randomBool()),
    NotificationItem(title: "Your application has been approved. Please wait to be contacted", timestamp: randomDate(), image: UIImage(named: "notification")!, isNew: randomBool()),
    NotificationItem(title: "Your application has been approved. Please wait to be contacted", timestamp: randomDate(), image: UIImage(named: "notification")!, isNew: randomBool()),
]

var globalUserInfo = UserInfo()
