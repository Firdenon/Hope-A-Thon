//
//  HomeViewController.swift
//  Hope-A-Thon
//
//  Created by Ferlix Yanto Wang on 03/09/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

// MARK: - Variables
var urgentActivities = [Activity]()
var nonUrgentActivities = [Activity]()

var bookmarkUrgentActivities = [Activity]()
var bookmarkNonUrgentActivities = [Activity]()

var ongoingActivities = [Activity]()
var completedActivities = [Activity]()

class HomeViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var upperSegment: UISegmentedControl!
    @IBOutlet weak var homeTableView: UITableView!
    
    
    // MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        urgentActivities.append(Activity(title: "PEDULI LOMBOK", date: "27/09/2018 - 30/09/2018", location: "Lombok", ngo: "HOPE", image: #imageLiteral(resourceName: "Lake")))
        urgentActivities.append(Activity(title: "PEDULI JOGJA", date: "31/09/2018 - 27/10/2018", location: "Jogjakarta", ngo: "HOPE - 2", image: #imageLiteral(resourceName: "Mountain")))
        
        nonUrgentActivities.append(Activity(title: "LANGIT INDONESIA", date: "27/10/2018 - 27/11/2018", location: "Jakarta", ngo: "HOPE", image: #imageLiteral(resourceName: "Sky")))
        nonUrgentActivities.append(Activity(title: "Danau Toba Kita", date: "30/09/2018 - 05/10/2018", location: "Sumatera", ngo: "HOPE", image: #imageLiteral(resourceName: "Lake")))
        
        bookmarkUrgentActivities.append(Activity(title: "PEDULI PANTAI LOMBOK", date: "27/08/2018 - 27/09/2018", location: "Lombok", ngo: "HOPE", image: #imageLiteral(resourceName: "Sea")))
        
        bookmarkUrgentActivities.append(Activity(title: "PEDULI LOMBOK", date: "27/08/2018 - 27/09/2018", location: "Lombok", ngo: "HOPE", image: #imageLiteral(resourceName: "Hill")))
        
        bookmarkNonUrgentActivities.append(Activity(title: "GUNUNG SEMERU", date: "27/08/2018 - 27/09/2018", location: "Jawa", ngo: "HOPE", image: #imageLiteral(resourceName: "Hill")))
        
        bookmarkNonUrgentActivities.append(Activity(title: "GUNUNG WIJAYA", date: "27/08/2018 - 27/09/2018", location: "Jawa", ngo: "HOPE", image: #imageLiteral(resourceName: "Sea")))
        
        ongoingActivities.append(Activity(title: "PEDULI GUNUNG BROMO", date: "27/08/2018 - 27/09/2018", location: "Solo", ngo: "HOPE", image: #imageLiteral(resourceName: "Mountain")))
        
        ongoingActivities.append(Activity(title: "PEDULI GUNUNG MERAPI", date: "27/08/2018 - 27/09/2018", location: "Indonesia", ngo: "HOPE", image: #imageLiteral(resourceName: "Mountain")))
        
        completedActivities.append(Activity(title: "DANAU TOBA", date: "27/08/2018 - 27/09/2018", location: "Padang", ngo: "HOPE", image: #imageLiteral(resourceName: "Lake")))
        
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
//        var activity = Activity()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell") as! HomeTableViewCell
//        cell.setCell(activity: activity)
        if upperSegment.selectedSegmentIndex == 0 {
            cell.titleLabel.text = urgentActivities[indexPath.row].title
            cell.titleLabel.addCharacterSpacing()
            cell.dateLabel.text = urgentActivities[indexPath.row].date
            cell.locationLabel.text = urgentActivities[indexPath.row].location
            cell.ngoLabel.text = urgentActivities[indexPath.row].ngo
            cell.activityImage.image = urgentActivities[indexPath.row].image
        } else {
            cell.titleLabel.text = nonUrgentActivities[indexPath.row].title
            cell.dateLabel.text = nonUrgentActivities[indexPath.row].date
            cell.locationLabel.text = nonUrgentActivities[indexPath.row].location
            cell.ngoLabel.text = nonUrgentActivities[indexPath.row].ngo
            cell.activityImage.image = nonUrgentActivities[indexPath.row].image

        }
        
        cell.layer.borderWidth = 0.5
        cell.layer.cornerRadius = 14
//        cell.clipsToBounds = false
        return cell
    }
}
extension UILabel {
    func addCharacterSpacing(kernValue: Double = 1.75) {
        if let labelText = text, labelText.count > 0 {
            let attributedString = NSMutableAttributedString(string: labelText)
            attributedString.addAttribute(NSAttributedStringKey.kern, value: kernValue, range: NSRange(location: 0, length: attributedString.length - 1))
            attributedText = attributedString
        }
    }
}
