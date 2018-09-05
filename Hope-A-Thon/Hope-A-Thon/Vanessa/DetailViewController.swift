//
//  DetailViewController.swift
//  postView
//
//  Created by Vanessa Wijaya on 03/09/18.
//  Copyright © 2018 Vanessa Wijaya. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableList: UITableView!
    @IBOutlet weak var resultCheckbox: UITextField!
    @IBOutlet weak var applyButton: UIButton!
    var tempResult:String!
    @IBOutlet weak var resultTextView: UITextView!
    
    @IBOutlet weak var chooseLabel: UILabel!
    @IBOutlet weak var motivationLabel: UILabel!
    @IBOutlet weak var headerLabel: UILabel!
    
    
    @IBOutlet weak var motivationView: UIView!
    
    var listItemArray : [String] = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.4235294118, green: 0.7137254902, blue: 0.8549019608, alpha: 1)
        chooseLabel.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        chooseLabel.addCharacterSpacing(kernValue: 2.33)
       
        
        motivationView.layer.borderWidth = 0.5
        motivationView.layer.cornerRadius = 10
        motivationView.layer.borderColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        
        motivationLabel.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        motivationLabel.addCharacterSpacing(kernValue: 2.33)
//
//
//        listItemArray.append("A")
//        listItemArray.append("B")
//        listItemArray.append("C")
//        listItemArray.append("D")
//        listItemArray.append("E")
//        listItemArray.append("F")

        
//        tableList.register(UINib.init(nibName : "CheckMarkViewCell", bundle : nil), forCellReuseIdentifier: "CheckListIdentifier")
//
//        tableList.dataSource = self
//        tableList.delegate = self
//
         resultTextView.layer.borderColor = #colorLiteral(red: 0.9058823529, green: 0.8941176471, blue: 0.8941176471, alpha: 1)
        resultTextView.layer.borderWidth = 0.5
        
       
    }
            
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextSegue = segue.destination as? TestViewController
        nextSegue?.tempResult = self.resultTextView.text!
    }
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListIdentifier") as! CheckMarkViewCell
        cell.titleLabel.text = listItemArray[indexPath.row]
        cell.selectionStyle = .none
        cell.buttonChecked.addTarget(self, action: #selector(checkButtonClicked(sender:)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItemArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 71.0
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        print("button pressed")
        
        if sender.isSelected{
            sender.isSelected = false
        }else {
            sender.isSelected = true
        }
    }
    
    @objc func checkButtonClicked (sender : UIButton){
        print("button pressed")

        if sender.isSelected{
            sender.isSelected = false
        }else {
            sender.isSelected = true
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
