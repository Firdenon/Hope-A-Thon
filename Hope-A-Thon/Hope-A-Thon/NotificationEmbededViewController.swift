//
//  NotificationEmbededViewController.swift
//  Hope-A-Thon
//
//  Created by Cifran on 04/09/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit
import UserNotifications

class NotificationEmbededViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let thereIsNewNotification = notificationItems.contains { (item) -> Bool in
//            return item.isNew
//        }
//        toggleNotificationIcon(isNew: thereIsNewNotification)
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        var image: UIImage!
        image = UIImage(named: "icon_bell_w")!.withRenderingMode(.alwaysOriginal)
        image = resizeImage(image: image, targetSize: CGSize(width: 20, height: 20))
        
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(onTapNotification(_:)), for: .touchDown)
        let barButton = UIBarButtonItem(customView: button)
        navigationItem.rightBarButtonItem = barButton
        toggleNotificationBadge()
        
        UNUserNotificationCenter.current().delegate = self
        
//        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(testNotif))
//        doubleTap.numberOfTapsRequired = 2
//        self.view.addGestureRecognizer(doubleTap)
    }
    
//    @objc func testNotif() {
//        NotificationManager.instance.notifAcceptance(NotificationItem(title: "Gempa Lombok", desc: "Your application has been accepted. Waiting to get approved.", timestamp: Date(), image: UIImage(named: "hopeindonesia_logo")!, isNew: true))
//    }
    
    
    private func toggleNotificationBadge() {
        let count = notificationItems.filter { (item) -> Bool in
            return item.isNew
        }.count
        if count <= 0 {
            navigationItem.rightBarButtonItem?.removeBadge()
        } else {
            navigationItem.rightBarButtonItem?.addBadge(number: count)
        }
    }
    
//    private func toggleNotificationIcon(isNew: Bool) {
//        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
//        var image: UIImage!
//        image = isNew ?
//            UIImage(named: "icon_bell_w")!.withRenderingMode(.alwaysTemplate) :
//            UIImage(named: "icon_bell_w")!.withRenderingMode(.alwaysTemplate)
//        image = resizeImage(image: image, targetSize: CGSize(width: 20, height: 20))
//
//        button.setImage(image, for: .normal)
//        button.addTarget(self, action: #selector(onTapNotification(_:)), for: .touchDown)
//        let barButton = UIBarButtonItem(customView: button)
//        navigationItem.rightBarButtonItem = barButton
//    }

    private var notificationIsOpen = false
    private var notificationVC = NotificationTableViewController()
    
    @IBAction func onTapNotification(_ sender: Any) {
        for item in notificationItems {
            item.isNew = false
        }
//        toggleNotificationIcon(isNew: false)
        
        notificationIsOpen = !notificationIsOpen
        if notificationIsOpen {
            self.view.addSubview(notificationVC.view)
            self.addChildViewController(notificationVC)
            notificationVC.view.layoutIfNeeded()
            
            notificationVC.view.frame = CGRect(
                x: UIScreen.main.bounds.size.width,
                y: 0,
                width: UIScreen.main.bounds.size.width,
                height: UIScreen.main.bounds.size.height
            )
            
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self.notificationVC.view.frame=CGRect(
                    x: 0,
                    y: 0,
                    width: UIScreen.main.bounds.size.width,
                    height: UIScreen.main.bounds.size.height
                )
            })
            
        } else {
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self.notificationVC.view.frame = CGRect(
                    x: UIScreen.main.bounds.size.width,
                    y: 0,
                    width: UIScreen.main.bounds.size.width,
                    height: UIScreen.main.bounds.size.height
                )
                self.notificationVC.view.layoutIfNeeded()
                self.notificationVC.view.backgroundColor = UIColor.clear
            }, completion: { _ in
                self.notificationVC.view.removeFromSuperview()
                self.notificationVC.removeFromParentViewController()
                self.toggleNotificationBadge()
            })
        }
    }
}

extension NotificationEmbededViewController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        //displaying the ios local notification when app is in foreground
        completionHandler([.alert, .badge, .sound])
        toggleNotificationBadge()
    }
}
