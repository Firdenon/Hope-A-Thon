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

private var globalImageNotif = UIImage(named: "hopeindonesia_logo")!

private let notifDescs = [
    "Your application has been accepted. Waiting to get screening.",
    "Your application has been approved. You will be contacted later by NGO officer.",
    "Your application has been sorted."
]

private func randomNotifDesc() -> String {
    return notifDescs[Int(arc4random_uniform(UInt32(notifDescs.count)))]
}

var notificationItems = [
    NotificationItem(title: "Gempa Lombok", desc: randomNotifDesc(), timestamp: randomDate(), image: globalImageNotif, isNew: randomBool()),
    NotificationItem(title: "Tsunami Aceh", desc: randomNotifDesc(), timestamp: randomDate(), image: globalImageNotif, isNew: randomBool()),
    NotificationItem(title: "Banjir Jakarta", desc: randomNotifDesc(), timestamp: randomDate(), image: globalImageNotif, isNew: randomBool()),
    NotificationItem(title: "Peduli Gunung", desc: randomNotifDesc(), timestamp: randomDate(), image: globalImageNotif, isNew: randomBool()),
    NotificationItem(title: "Langit Indonesia", desc: randomNotifDesc(), timestamp: randomDate(), image: globalImageNotif, isNew: randomBool()),
    NotificationItem(title: "Danau Toba Kita", desc: randomNotifDesc(), timestamp: randomDate(), image: globalImageNotif, isNew: randomBool()),
    NotificationItem(title: "Gempa Tangerang", desc: randomNotifDesc(), timestamp: randomDate(), image: globalImageNotif, isNew: randomBool()),
    NotificationItem(title: "Puting Beliung", desc: randomNotifDesc(), timestamp: randomDate(), image: globalImageNotif, isNew: randomBool()),
    NotificationItem(title: "Kelaparan", desc: randomNotifDesc(), timestamp: randomDate(), image: globalImageNotif, isNew: randomBool()),
    NotificationItem(title: "Tsunami", desc: randomNotifDesc(), timestamp: randomDate(), image: globalImageNotif, isNew: randomBool()),
]

func addNewNotification(_ n: NotificationItem) {
    notificationItems.append(n)
    
}

var globalUserInfo = UserInfo()

