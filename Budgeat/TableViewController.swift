//
//  TableViewController.swift
//  Budgeat
//
//  Created by William Inx on 25/04/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var foodData2:[Food] = []
    var passingData:Food?
    var restaurantData2:[Restaurant] = []
    var startsFrom:[String:Int] = [:]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadFoodData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodData2.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableContentTemplate") as! TodayCell
        cell.foodName.text = foodData2[indexPath.row].name
        
        let tempName:String = cell.foodName.text ?? "Not Found"
        let tempPrice:Int = startsFrom[tempName] ?? 0
        
        cell.foodDetail.text = "Starts from \(formatNumber(tempPrice))"
        cell.foodImage.image = foodData2[indexPath.row].image

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        
        passingData = foodData2[row]
        
        performSegue(withIdentifier: "foodDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "foodDetail" {
            let destination = segue.destination as? FoodDetailViewController
            destination?.passedData = passingData
        }
    }
    

    func loadFoodData() {
        for restaurant in zone_GOP.restaurants {
            for food in restaurant.foods {
                if !foodData2.contains(where: {$0.name == food.name}) {
                    foodData2.append(food)
                    restaurantData2.append(restaurant)
                }
                if startsFrom[food.name] != nil {
                    if startsFrom[food.name] ?? Int(UInt16.max) > food.price {
                        startsFrom[food.name] = food.price
                    }
                }
                else {
                    startsFrom[food.name] = food.price
                }
            }
        }
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


