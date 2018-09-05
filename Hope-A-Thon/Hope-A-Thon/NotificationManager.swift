//
//  NotificationManager.swift
//  Hope-A-Thon
//
//  Created by Cifran on 04/09/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import Foundation
import UserNotifications

class NotificationManager {
    static let  instance = NotificationManager()
    
    private init() {
        
    }
    
    func notifAcceptance(_ n: NotificationItem) {
        notificationItems.append(n)
        
        //creating the notification content
        let content = UNMutableNotificationContent()
        
        //adding title, subtitle, body and badge
        content.title = "BEAVR"
        content.subtitle = n.title
        content.body = n.desc
//        content.badge = 1
        
        //getting the notification trigger
        //it will be called after 5 seconds
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        //getting the notification request
        let request = UNNotificationRequest(identifier: "BeavrNotification", content: content, trigger: trigger)
        
        //adding the notification to notification center
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}
