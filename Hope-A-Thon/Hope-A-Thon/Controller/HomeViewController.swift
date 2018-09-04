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
    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var recentLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var containerView: UIView!
    
    // MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nonUrgentActivities.append(Activity(title: "LANGIT INDONESIA", date: "27/10/2018 - 27/11/2018", location: "Jakarta", ngo: "HOPE", image: #imageLiteral(resourceName: "Sky"), bookmark: true))
        nonUrgentActivities.append(Activity(title: "Danau Toba Kita", date: "30/09/2018 - 05/10/2018", location: "Sumatera", ngo: "HOPE", image: #imageLiteral(resourceName: "Lake"), bookmark: false))
        
        bookmarkUrgentActivities.append(Activity(title: "PEDULI LOMBOK", date: "27/09/2018 - 30/09/2018", location: "Lombok", ngo: "HOPE", image: #imageLiteral(resourceName: "Lake"), bookmark: true))
        
        bookmarkNonUrgentActivities.append(Activity(title: "LANGIT INDONESIA", date: "27/10/2018 - 27/11/2018", location: "Jakarta", ngo: "HOPE", image: #imageLiteral(resourceName: "Sky"), bookmark: true))
        
        ongoingActivities.append(Activity(title: "PEDULI GUNUNG BROMO", date: "27/08/2018 - 27/09/2018", location: "Solo", ngo: "HOPE", image: #imageLiteral(resourceName: "Mountain"), bookmark: false))
        ongoingActivities.append(Activity(title: "PEDULI GUNUNG MERAPI", date: "27/08/2018 - 27/09/2018", location: "Indonesia", ngo: "HOPE", image: #imageLiteral(resourceName: "Mountain"), bookmark: false))
        
        completedActivities.append(Activity(title: "DANAU TOBA", date: "27/08/2018 - 27/09/2018", location: "Padang", ngo: "HOPE", image: #imageLiteral(resourceName: "Lake"), bookmark: false))
        
        setNavTitle()
        recentLabel.addCharacterSpacing(kernValue: 1.5)
        containerView.layer.borderWidth = 0.5
        containerView.layer.cornerRadius = 14
    }
    
    @IBAction func upperSegmentClicked() {
        homeTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? UrgentPageViewController {
            destination.urgentDelegate = self
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nonUrgentActivities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell") as! HomeTableViewCell
        cell.titleLabel.text = nonUrgentActivities[indexPath.row].title
        cell.titleLabel.addCharacterSpacing()
        cell.dateLabel.text = nonUrgentActivities[indexPath.row].date
        cell.locationLabel.text = nonUrgentActivities[indexPath.row].location
        cell.ngoLabel.text = nonUrgentActivities[indexPath.row].ngo
        cell.activityImage.image = nonUrgentActivities[indexPath.row].image
        
        cell.layer.borderWidth = 0.5
        cell.layer.cornerRadius = 14
        return cell
    }
    
    func setNavTitle() {
        let titleLabel = UILabel()
        titleLabel.attributedText = NSAttributedString(string: "HOME")
        titleLabel.font = UIFont(name: "HelveticaNeue", size: 17.0)
        titleLabel.textColor = UIColor.white
        titleLabel.addCharacterSpacing(kernValue: 2.25)
        titleLabel.sizeToFit()
        self.navigationItem.titleView = titleLabel
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

extension HomeViewController: UrgentDelegate {
    func urgentPageCount(urgentPageViewController: UrgentPageViewController, didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
    }
    
    func urgentPageIndex(urgentPageViewController: UrgentPageViewController, didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
    }
}
