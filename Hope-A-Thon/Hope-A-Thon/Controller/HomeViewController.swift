//
//  HomeViewController.swift
//  Hope-A-Thon
//
//  Created by Ferlix Yanto Wang on 03/09/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var upperSegment: UISegmentedControl!
    @IBOutlet weak var homeTableView: UITableView!
    
    // MARK: - Variables
    var urgentActivities = [Activity]()
    var nonUrgentActivities = [Activity]()
    
    // MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        urgentActivities.append(Activity(title: "Peduli Lombok", date: "27 August 2018", location: "Lombok", ngo: "HOPE", image: "Lake"))
        urgentActivities.append(Activity(title: "Peduli Jogjakarta", date: "19 June 2017", location: "Jogjakarta", ngo: "HOPE - 2", image: "Mountain"))
        
        nonUrgentActivities.append(Activity(title: "Langit Indonesia", date: "03 January 2015", location: "Jakarta", ngo: "HOPE", image: "Sky"))
        nonUrgentActivities.append(Activity(title: "Danau Toba Kita", date: "18 May 2017", location: "Sumatera", ngo: "HOPE", image: "Lake"))
        
        upperSegment.frame = CGRect.init(x: 0, y: 88, width: 375, height: 35)
    }
    
    @IBAction func upperSegmentClicked() {
        homeTableView.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if upperSegment.selectedSegmentIndex == 0 {
            return urgentActivities.count
        } else {
            return nonUrgentActivities.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var activity = Activity()
        if upperSegment.selectedSegmentIndex == 0 {
            activity = urgentActivities[indexPath.row]
        } else {
            activity = nonUrgentActivities[indexPath.row]
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell") as! HomeTableViewCell
        cell.setCell(activity: activity)
        return cell
    }
}
