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
    var selectedActivity: Activity!
    var selectedIndex: Int!
    
    // MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavTitle()
    }
    
    @IBAction func upperSegmentPressed() {
        activityTableView.reloadData()
    }
    
    func setNavTitle() {
        let titleLabel = UILabel()
        titleLabel.attributedText = NSAttributedString(string: "ACTIVITIES")
        titleLabel.font = UIFont(name: "HelveticaNeue", size: 17.0)
        titleLabel.textColor = UIColor.white
        titleLabel.addCharacterSpacing(kernValue: 2.25)
        titleLabel.sizeToFit()
        self.navigationItem.titleView = titleLabel
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ActivityDetailViewController {
            destination.detailActivity = selectedActivity
            destination.index = selectedIndex
        }
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "activityCell") as! ActivityTableViewCell
        if upperSegment.selectedSegmentIndex == 0 {
            cell.titleLabel.text = ongoingActivities[indexPath.row].title
            cell.dateLabel.text = ongoingActivities[indexPath.row].date
            cell.locationLabel.text = ongoingActivities[indexPath.row].location
            cell.ngoLabel.text = ongoingActivities[indexPath.row].ngo
            cell.activityImage.image = ongoingActivities[indexPath.row].image
        } else {
            cell.titleLabel.text = completedActivities[indexPath.row].title
            cell.dateLabel.text = completedActivities[indexPath.row].date
            cell.locationLabel.text = completedActivities[indexPath.row].location
            cell.ngoLabel.text = completedActivities[indexPath.row].ngo
            cell.activityImage.image = completedActivities[indexPath.row].image
        }
        
        cell.layer.borderWidth = 0.5
        cell.layer.cornerRadius = 14
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if upperSegment.selectedSegmentIndex == 0 {
            selectedActivity = ongoingActivities[indexPath.row]
        } else {
            selectedActivity = completedActivities[indexPath.row]
        }
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "activityToDetail", sender: self)
    }
}
