//
//  NotificationTableViewController.swift
//  HopeAthon
//
//  Created by Cifran on 03/09/18.
//  Copyright © 2018 Cifran. All rights reserved.
//

import UIKit

class NotificationTableViewController: UITableViewController {
    private let cellIdentifier = "cell"
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "NotificationTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.rowHeight = 65
    }
    
    override func viewDidAppear(_ animated: Bool) {
        notificationItems = notificationItems.sorted(by: { (a, b) -> Bool in
            return a.timestamp > b.timestamp
        })
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! NotificationTableViewCell
        cell.item = notificationItems[indexPath.row]
        return cell
    }
    
}
