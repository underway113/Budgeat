//
//  TableViewController.swift
//  Budgeat
//
//  Created by William Inx on 25/04/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet weak var foodImage01: UIImageView!
    @IBOutlet weak var foodImage02: UIImageView!
    @IBOutlet weak var foodImage03: UIImageView!
    @IBOutlet weak var foodImage04: UIImageView!
    
    var selectedImage:UIImage?
    
    @IBOutlet weak var foodOverlay: UIView!
    
    @IBAction func tap01(_ sender: UITapGestureRecognizer) {
        selectedImage = foodImage01.image
        performSegue(withIdentifier: "foodDetail", sender: self)
    }
    
    @IBAction func tap02(_ sender: UITapGestureRecognizer) {
        selectedImage = foodImage02.image
        performSegue(withIdentifier: "foodDetail", sender: self)

    }
    
    
    @IBAction func tap03(_ sender: UITapGestureRecognizer) {
        selectedImage = foodImage03.image
        performSegue(withIdentifier: "foodDetail", sender: self)

    }
    
    @IBAction func tap04(_ sender: UITapGestureRecognizer) {
        selectedImage = foodImage04.image
        performSegue(withIdentifier: "foodDetail", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! FoodDetailViewController
        destination.receivedImage = selectedImage
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodImage01.layer.cornerRadius = 5
        foodImage02.layer.cornerRadius = 5
        foodImage03.layer.cornerRadius = 5
        foodImage04.layer.cornerRadius = 5
        foodOverlay.layer.cornerRadius = 5
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
