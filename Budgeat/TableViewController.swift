//
//  TableViewController.swift
//  Budgeat
//
//  Created by William Inx on 25/04/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    
    @IBOutlet var foodImages: [UIImageView]!
    @IBOutlet var foodOverlays: [UIView]!
    
    @IBOutlet var todayTable: UITableView!
    
    //    var categories = ["Siomay" , "Daging" , "Laut"]
//    var prices = ["1000" , "2000" , "300"]
    var categories:[String] = []
    var restaurants:[Restaurant] = []
    var iterator = 0
    
    func loadFoodRestaurantData() {
        for restaurant in zone_GOP.restaurants {
            for food in restaurant.foods {
                if !categories.contains(food.name) {
                    categories.append(food.name)
                    print(categories)
                    break
                }
            }
            restaurants.append(restaurant)
        }
    }
    
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        
        selectedPic = foodImages[sender.view?.tag ?? 0].image
        selectedName = categories[sender.view?.tag ?? 0]
        
        performSegue(withIdentifier: "foodDetail", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadFoodRestaurantData()
        
        for foodOverlay in foodOverlays {
            foodOverlay.layer.cornerRadius = 6
        }
        for foodImage in foodImages {
            foodImage.layer.cornerRadius = 6
        }
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

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(TodayCell.self, forCellReuseIdentifier: "tableContentTemplate")
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableContentTemplate", for: indexPath) as! TodayCell
        cell.foodName.text = categories[iterator]
        cell.foodDetail.text = restaurants[iterator].name
        
        iterator += 1

        return cell
    }

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


