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
    @IBOutlet weak var bookmarkTableView: UITableView!
    
    // MARK: - Variables
    var mixArrayBookmark = [Activity]()
    
    // MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavTitle()
        mixArrayBookmark = bookmarkUrgentActivities + bookmarkNonUrgentActivities
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
}

extension BookmarkViewController: UITableViewDelegate, UITableViewDataSource {
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
        
        cell.layer.borderWidth = 0.5
        cell.layer.cornerRadius = 14
        cell.selectionStyle = .none
        
        return cell
    }
}
