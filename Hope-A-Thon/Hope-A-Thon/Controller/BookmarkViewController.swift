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
    var bookmarkUrgentActivities = [Activity]()
    var bookmarkNonUrgentActivities = [Activity]()
    
    // MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bookmarkUrgentActivities.append(Activity(title: "Peduli Pantai Lombok", date: "09 September 2017", location: "Lombok", ngo: "HOPE", image: "Sea"))
        
        bookmarkNonUrgentActivities.append(Activity(title: "Gunung Semeru", date: "03 February 2016", location: "Jawa", ngo: "HOPE", image: "Hill"))
        
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
        var activity = Activity()
        if upperSegment.selectedSegmentIndex == 0 {
            activity = bookmarkUrgentActivities[indexPath.row]
        } else {
            activity = bookmarkNonUrgentActivities[indexPath.row]
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookmarkCell") as! BookmarkTableViewCell
        cell.setCell(activity: activity)
        return cell
    }
}
