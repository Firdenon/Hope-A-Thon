//
//  BookmarkViewController.swift
//  Hope-A-Thon
//
//  Created by Ferlix Yanto Wang on 03/09/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

class BookmarkViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    // MARK: - Outlets
    @IBOutlet weak var bookmarkTableView: UITableView!
    
    // MARK: - Variables
    var mixArrayBookmark = [Activity]()
    
    // MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavTitle()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mixArrayBookmark = bookmarkUrgentActivities + bookmarkNonUrgentActivities
        bookmarkTableView.reloadData()
    }
    
    func setNavTitle() {
        let titleLabel = UILabel()
        titleLabel.attributedText = NSAttributedString(string: "BOOKMARK")
        titleLabel.font = UIFont(name: "HelveticaNeue", size: 17.0)
        titleLabel.textColor = UIColor.white
        titleLabel.addCharacterSpacing(kernValue: 2.25)
        titleLabel.sizeToFit()
        self.navigationItem.titleView = titleLabel
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mixArrayBookmark.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookmarkCell") as! BookmarkTableViewCell
        cell.titleLabel.text = mixArrayBookmark[indexPath.row].title
        cell.dateLabel.text = mixArrayBookmark[indexPath.row].date
        cell.locationLabel.text = mixArrayBookmark[indexPath.row].location
        cell.ngoLabel.text = mixArrayBookmark[indexPath.row].ngo
        cell.activityImage.image = mixArrayBookmark[indexPath.row].image
        cell.bookmarkBtn.tag = indexPath.row
//        cell.bookmarkBtn.addTarget(self, action: Selector("clicked"), for: UIControlEvents.touchUpInside)
        cell.bookmarkBtn.addTarget(self, action: #selector(BookmarkViewController.clicked(_:)), for: .touchUpInside)
        if mixArrayBookmark[indexPath.row].bookmark == true {
            print("1 , 1")
            cell.bookmarkBtn.setImage(#imageLiteral(resourceName: "starActive"), for: .normal)
        }
        else if mixArrayBookmark[indexPath.row].bookmark == false {
            print("2 , 2")
            cell.bookmarkBtn.setImage(#imageLiteral(resourceName: "starNot"), for: .normal)
        }
        
        cell.layer.borderWidth = 0.5
        cell.layer.cornerRadius = 14
        cell.selectionStyle = .none
        
        return cell
    }
    

    
    @objc func clicked(_ sender: UIButton){
        
//        let data = mixArrayBookmark[sender.tag]
        if mixArrayBookmark[sender.tag].bookmark == false {
            print("1")
            mixArrayBookmark[sender.tag].bookmark = true
        }
        else{
            print("2")
            mixArrayBookmark[sender.tag].bookmark = false
            mixArrayBookmark.remove(at: sender.tag)
            if sender.tag>=bookmarkUrgentActivities.count{
                var newIndex = sender.tag - bookmarkUrgentActivities.count
                bookmarkNonUrgentActivities.remove(at: newIndex)
                
            }
            else{
                var newIndex = sender.tag
                bookmarkUrgentActivities.remove(at: newIndex)
                urgentActivities[newIndex].bookmark = false
            }
            
            
        }
        
        
        bookmarkTableView.reloadData()
    }
  
    
}

//extension BookmarkViewController: UITableViewDelegate, UITableViewDataSource {
//
//
//
//}
