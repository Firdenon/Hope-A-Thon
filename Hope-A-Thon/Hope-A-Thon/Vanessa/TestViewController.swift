//
//  TestViewController.swift
//  postView
//
//  Created by Vanessa Wijaya on 04/09/18.
//  Copyright © 2018 Vanessa Wijaya. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    @IBOutlet weak var lblResult: UILabel!
    var tempResult : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.4235294118, green: 0.7137254902, blue: 0.8549019608, alpha: 1)
        lblResult.text = tempResult

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
