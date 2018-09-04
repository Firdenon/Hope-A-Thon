//
//  NotificationEmbededViewController.swift
//  Hope-A-Thon
//
//  Created by Cifran on 04/09/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

class NotificationEmbededViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let thereIsNewNotification = notificationItems.contains { (item) -> Bool in
            return item.isNew
        }
//        toggleNotificationIcon(isNew: thereIsNewNotification)
    }

}
