//
//  ProfileViewController.swift
//  Hope-A-Thon
//
//  Created by Ricky Adi Kuncoro on 04/09/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//



import UIKit

class ProfileViewController: UIViewController, UINavigationBarDelegate {
    
    
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.profileImage.layer.cornerRadius = self.profileImage.frame.size.width / 2
        self.profileImage.clipsToBounds = true
        self.profileImage.layer.borderWidth = CGFloat(3.5)
        self.profileImage.layer.borderColor = UIColor.white.cgColor
        UIApplication.shared.statusBarStyle = .lightContent
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Cancel"
        navigationItem.backBarButtonItem = backItem
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
