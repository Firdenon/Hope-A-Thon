//
//  BookmarkViewController.swift
//  Hope-A-Thon
//
//  Created by Ferlix Yanto Wang on 03/09/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit



class BookmarkViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var upperSegment: UISegmentedControl!
    @IBOutlet weak var bookmarkTableView: UITableView!
    
    // MARK: - Variables
    
    
    // MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        upperSegment.frame = CGRect.init(x: 0, y: 88, width: 375, height: 35)
    }
    
    @IBAction func upperSegmentClicked() {
        bookmarkTableView.reloadData()
    }
}

extension BookmarkViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if upperSegment.selectedSegmentIndex == 0 {
            return bookmarkUrgentActivities.count
        } else {
            return bookmarkNonUrgentActivities.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookmarkCell") as! BookmarkTableViewCell
        if upperSegment.selectedSegmentIndex == 0 {
            cell.titleLabel.text = bookmarkUrgentActivities[indexPath.row].title
            cell.dateLabel.text = bookmarkUrgentActivities[indexPath.row].date
            cell.locationLabel.text = bookmarkUrgentActivities[indexPath.row].location
            cell.ngoLabel.text = bookmarkUrgentActivities[indexPath.row].ngo
            cell.activityImage.image = bookmarkUrgentActivities[indexPath.row].image
        } else {
            cell.titleLabel.text = bookmarkNonUrgentActivities[indexPath.row].title
            cell.dateLabel.text = bookmarkNonUrgentActivities[indexPath.row].date
            cell.locationLabel.text = bookmarkNonUrgentActivities[indexPath.row].location
            cell.ngoLabel.text = bookmarkNonUrgentActivities[indexPath.row].ngo
            cell.activityImage.image = bookmarkNonUrgentActivities[indexPath.row].image
            
        }
        cell.layer.borderWidth = 0.5
        cell.layer.cornerRadius = 14
        return cell
    }
}
