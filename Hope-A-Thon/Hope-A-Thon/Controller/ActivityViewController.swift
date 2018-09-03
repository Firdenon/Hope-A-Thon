//
//  ActivityViewController.swift
//  Hope-A-Thon
//
//  Created by Ferlix Yanto Wang on 03/09/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

class ActivityViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var upperSegment: UISegmentedControl!
    @IBOutlet weak var activityTableView: UITableView!
    
    
    // MARK: - Variables
    var ongoingActivities = [Activity]()
    var completedActivities = [Activity]()
    
    // MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ongoingActivities.append(Activity(title: "Peduli Gunung Bromo", date: "10 October 2016", location: "Solo", ngo: "HOPE", image: "Mountain"))
        
        completedActivities.append(Activity(title: "Danau Sumatra", date: "08 March 2017", location: "Padang", ngo: "HOPE", image: "Lake"))
        
        upperSegment.frame = CGRect.init(x: 0, y: 88, width: 375, height: 35)
    }
    
    @IBAction func upperSegmentPressed() {
        activityTableView.reloadData()
    }
}

extension ActivityViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if upperSegment.selectedSegmentIndex == 0 {
            return ongoingActivities.count
        } else {
            return completedActivities.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var activity = Activity()
        if upperSegment.selectedSegmentIndex == 0 {
            activity = ongoingActivities[indexPath.row]
        } else {
            activity = completedActivities[indexPath.row]
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "activityCell") as! ActivityTableViewCell
        cell.setCell(activity: activity)
        return cell
    }
}
