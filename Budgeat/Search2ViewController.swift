//
//  Search2ViewController.swift
//  Budgeat
//
//  Created by Jeremy Adam on 27/04/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import UIKit

class Search2ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    //IBOUTLET
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var resultTableView: UITableView!
    
    //VARIABLE
    var foodData2:[Food] = []
    var searching2 = false
    var searchFood2 = [Food]()
    var passingData:Food?
    
    //START SEARCH BAR
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        searchFood2 = foodData2.filter({$0.name.lowercased().contains(searchText.lowercased())})
        searching2 = true
        if searchBar.text == "" {
            searching2 = false
        }
        
        resultTableView.reloadData()
    }
    
    //END SEARCH BAR
    
    
    //START TABLE
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching2 {
            return searchFood2.count
        } else {
            // Get total food in the data class
            return foodData2.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! Search2TableViewCell
        
        if searching2 {
            cell.labelCell.text = searchFood2[indexPath.row].name
            cell.imageCell.image = searchFood2[indexPath.row].image
        } else {
            cell.labelCell.text = foodData2[indexPath.row].name
            cell.imageCell.image = foodData2[indexPath.row].image
        }
        
        tableView.rowHeight = 110
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        if searching2 {
            passingData = searchFood2[row]
        } else {
            passingData = foodData2[row]
        }
        
        performSegue(withIdentifier: "goToSearchDetail", sender: row)
        
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSearchDetail" {
            let destination = segue.destination as? FoodDetailViewController
            destination?.passedData = passingData
        }
    }
    
    //END TABLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFoodData()
        resultTableView.dataSource = self
        resultTableView.delegate = self
        searchBar.delegate = self
        
        searchBar.searchBarStyle = UISearchBar.Style.minimal
        searchBar.placeholder = " Search..."
        
    }
    
    
    //Get Food Data from FoodData.swift
    func loadFoodData() {
        for restaurant in zone_GOP.restaurants {
            for food in restaurant.foods {
                if !foodData2.contains(where: {$0.name == food.name}) {
                    foodData2.append(food)
                }
            }
        }
    }
    
    
}
