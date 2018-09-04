//
//  Notification.swift
//  HopeAthon
//
//  Created by Cifran on 03/09/18.
//  Copyright © 2018 Cifran. All rights reserved.
//

import UIKit

class NotificationItem {
    var title: String!
    var desc: String!
    var timestamp: Date!
    var image: UIImage!
    var isNew: Bool!
    
    init(title: String, desc: String, timestamp: Date, image: UIImage, isNew: Bool) {
        self.title = title
        self.timestamp = timestamp
        self.image = image
        self.isNew = isNew
        self.desc = desc
    }
    
    func timestampInString() -> String {
        let interval = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: self.timestamp, to: Date())
        
        if let year = interval.year, year > 0 {
            return year == 1 ? "\(year)" + " " + "year ago" :
                "\(year)" + " " + "years ago"
        } else if let month = interval.month, month > 0 {
            return month == 1 ? "\(month)" + " " + "month ago" :
                "\(month)" + " " + "months ago"
        } else if let day = interval.day, day > 0 {
            return day == 1 ? "\(day)" + " " + "day ago" :
                "\(day)" + " " + "days ago"
        } else if let hour = interval.hour, hour > 0 {
            return hour == 1 ? "\(hour)" + " " + "hour ago" :
                "\(hour)" + " " + "hours ago"
        } else if let minute = interval.minute, minute > 0 {
            return minute == 1 ? "\(minute)" + " " + "minute ago" :
                "\(minute)" + " " + "minutes ago"
        } else {
            return "a moment ago"
        }
        
    }
}
