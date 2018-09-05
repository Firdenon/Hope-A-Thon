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

class HomeViewController: NotificationEmbededViewController {

    // MARK: - Outlets
    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var recentLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var containerView: UIView!
    
    var selectedActivity: Activity!
    var selectedIndex: Int!
    
    // MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nonUrgentActivities.append(Activity(title: "Kebakaran Hutan", date: "27/10/2018 - 27/11/2018", location: "Riau", ngo: "GovHelp", image: #imageLiteral(resourceName: "kebakaranhutan"), bookmark: true))
        nonUrgentActivities.append(Activity(title: "Erupsi Gunung Bromo", date: "30/09/2018 - 05/10/2018", location: "Jawa Timur", ngo: "Here2Help", image: #imageLiteral(resourceName: "gunungbromo"), bookmark: false))
        nonUrgentActivities.append(Activity(title: "PEDULI LOMBOK", date: "27/09/2018 - 30/09/2018", location: "Lombok", ngo: "HOPE", image: #imageLiteral(resourceName: "gempalombok"), bookmark: true))
        nonUrgentActivities.append(Activity(title: "Erupsi Gunung Sinabung", date: "27/08/2018 - 27/09/2018", location: "Padang", ngo: "Medaners", image: #imageLiteral(resourceName: "erupsisinabung"), bookmark: false))
        
        bookmarkNonUrgentActivities.append(Activity(title: "Kebakaran Hutan", date: "27/10/2018 - 27/11/2018", location: "Riau", ngo: "GovHelp", image: #imageLiteral(resourceName: "kebakaranhutan"), bookmark: true))
        bookmarkNonUrgentActivities.append(Activity(title: "PEDULI LOMBOK", date: "27/09/2018 - 30/09/2018", location: "Lombok", ngo: "HOPE", image: #imageLiteral(resourceName: "gempalombok"), bookmark: true))
        
        bookmarkUrgentActivities.append(Activity(title: "BANJIR NTT", date: "31/09/2018 - 27/10/2018", location: "NTT", ngo: "Stay.org", image: #imageLiteral(resourceName: "banjirntt"), bookmark: true))
        
        ongoingActivities.append(Activity(title: "LONGSOR", date: "27/08/2018 - 27/09/2018", location: "Puncak", ngo: "The Bogorian", image: #imageLiteral(resourceName: "longsor"), bookmark: false))
        ongoingActivities.append(Activity(title: "PEDULI LOMBOK", date: "27/09/2018 - 30/09/2018", location: "Lombok", ngo: "HOPE", image: #imageLiteral(resourceName: "gempalombok"), bookmark: false))
        
        completedActivities.append(Activity(title: "Erupsi Gunung Sinabung", date: "27/08/2018 - 27/09/2018", location: "Padang", ngo: "Medaners", image: #imageLiteral(resourceName: "erupsisinabung"), bookmark: false))
        
        setNavTitle()
        recentLabel.addCharacterSpacing(kernValue: 1.5)
        containerView.layer.borderWidth = 0.5
        containerView.layer.cornerRadius = 14
    }
    
    @IBAction func upperSegmentClicked() {
        homeTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        homeTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? UrgentPageViewController {
            destination.urgentDelegate = self
        } else if let destination = segue.destination as? HomeDetailViewController {
            destination.detailActivity = selectedActivity
            destination.index = selectedIndex
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
        cell.bookmarkBtn.tag = indexPath.row
        cell.bookmarkBtn.addTarget(self, action: #selector(HomeViewController.clicked(_:)), for: .touchUpInside)
        
        if nonUrgentActivities[indexPath.row].bookmark == true{
            cell.bookmarkBtn.setImage(#imageLiteral(resourceName: "starActive"), for: .normal)
           
        }
        else if nonUrgentActivities[indexPath.row].bookmark == false{
                cell.bookmarkBtn.setImage(#imageLiteral(resourceName: "starNot"), for: .normal)
        }
        
        cell.layer.borderWidth = 0.5
        cell.layer.cornerRadius = 14
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedActivity = nonUrgentActivities[indexPath.row]
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "homeToDetail", sender: self)
    }
    
    @objc func clicked(_ sender: UIButton){

        if nonUrgentActivities[sender.tag].bookmark == false {
            nonUrgentActivities[sender.tag].bookmark = true
            bookmarkNonUrgentActivities.append(nonUrgentActivities[sender.tag])
        }
        else{
    
            nonUrgentActivities[sender.tag].bookmark = false
            for i in 0...bookmarkNonUrgentActivities.count-1{
                if bookmarkNonUrgentActivities[i].title == nonUrgentActivities[sender.tag].title{
                     bookmarkNonUrgentActivities[i].bookmark = false
                    bookmarkNonUrgentActivities.remove(at: i)
                }
                else{
                    print("empty")
                }
            }
           
        }
            
            homeTableView.reloadData()
    
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
    
    @IBAction func unwindToHome(_ sender: UIStoryboardSegue) {
        NotificationManager.instance.notifAcceptance(NotificationItem(title: selectedActivity.title, desc: "Your application has been accepted", timestamp: Date(), image: UIImage(named: "hopeindonesia_logo")!, isNew: true))
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
