//
//  SearchViewController.swift
//  Hope-A-Thon
//
//  Created by Luffandri Luffandri on 03/09/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import Foundation
import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
   
    var currentArray = [Activity]()
    var currentArray1 = [Activity]()
    var currentArray2 = [Activity]()
    var mixArrayActivity = [Activity]()
    var mixArrayHome = [Activity]()
    var mixArrayBookmark = [Activity]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mixArrayHome = urgentActivities + nonUrgentActivities
        
        mixArrayActivity = ongoingActivities + completedActivities
        
        mixArrayBookmark = bookmarkUrgentActivities + bookmarkNonUrgentActivities
        
        currentArray = mixArrayHome
        currentArray1 = mixArrayBookmark
        currentArray2 = mixArrayActivity
  
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return currentArray.count
        }
        else if section == 1 {
            return currentArray1.count
        }
        else if section == 2{
            return currentArray2.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell") as? SearchTableViewCell else{ return UITableViewCell() }
        
        if indexPath.section == 0 {
            print("1")
            cell.titleLable.text = currentArray[indexPath.row].title
            cell.dateLabel.text = currentArray[indexPath.row].date
            cell.locationLabel.text = currentArray[indexPath.row].location
            cell.ngoLabel.text = currentArray[indexPath.row].ngo
            cell.imageV.image = currentArray[indexPath.row].image
        }
        else if indexPath.section == 1 {
          print("tesss")
            cell.titleLable.text = currentArray1[indexPath.row].title
            cell.dateLabel.text = currentArray1[indexPath.row].date
            cell.locationLabel.text = currentArray1[indexPath.row].location
            cell.ngoLabel.text = currentArray1[indexPath.row].ngo
            cell.imageV.image = currentArray1[indexPath.row].image
           
        }
        else{
            cell.titleLable.text = currentArray2[indexPath.row].title
            cell.dateLabel.text = currentArray2[indexPath.row].date
            cell.locationLabel.text = currentArray2[indexPath.row].location
            cell.ngoLabel.text = currentArray2[indexPath.row].ngo
            cell.imageV.image = currentArray2[indexPath.row].image
        }
        cell.layer.borderWidth = 0.5
        cell.layer.cornerRadius = 14
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.textAlignment = NSTextAlignment(rawValue: 1)!
        if section == 0 {
            label.text = "Home"
        }
        else if section == 1 {
            label.text = "Bookmark"
        }
        else if section == 2 {
            label.text = "Activities"
        }
        label.backgroundColor = UIColor.lightGray
        return label
    }
    
    func setSearchBar() {
        searchBar.delegate = self
    }
    
    //    public func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int){
    //
    //    }
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        guard !searchText.isEmpty else {

            currentArray = mixArrayHome
            currentArray1 = mixArrayBookmark
            currentArray2 = mixArrayActivity
            
            table.reloadData()
            return
            
        }
        currentArray  = mixArrayHome.filter({ activity -> Bool in
            
            activity.title.lowercased().contains(searchText.lowercased()) || activity.ngo.lowercased().contains(searchText.lowercased()) || activity.location.lowercased().contains(searchText.lowercased())
        
        })
        
        currentArray1  = mixArrayBookmark.filter({ activity -> Bool in
            
            activity.title.lowercased().contains(searchText.lowercased()) || activity.ngo.lowercased().contains(searchText.lowercased()) || activity.location.lowercased().contains(searchText.lowercased())
            
        })
        
        currentArray2  = mixArrayActivity.filter({ activity -> Bool in
            
            activity.title.lowercased().contains(searchText.lowercased()) || activity.ngo.lowercased().contains(searchText.lowercased()) || activity.location.lowercased().contains(searchText.lowercased())
            
        })

        table.reloadData()
    }
    
}




