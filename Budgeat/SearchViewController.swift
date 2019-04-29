//
//  SearchViewController.swift
//  Budgeat
//
//  Created by William Inx on 25/04/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var tabelSearch: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchFood = [Food]()
    var searching = false
    var foodData:[Food] = []
    
    
    func loadFoodData() {
        for restaurant in zone_GOP.restaurants {
            for food in restaurant.foods {
                if !foodData.contains(where: {$0.name == food.name}) {
                    foodData.append(food)
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadFoodData()
        
        // Do any additional setup after loading the view.
//        searchBar.searchBarStyle = UISearchBar.Style.minimal
        searchBar.placeholder = " Search..."
        searchBar.showsCancelButton = true
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        
        let tapDetail = UITapGestureRecognizer(target: self, action: #selector(tapDetailSegue
            ))
        tabelSearch.addGestureRecognizer(tapDetail)
    }
    
    @objc func tapDetailSegue() {
       performSegue(withIdentifier: "searchFoodToDetail", sender: self)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchFood.count
        } else {
            // Get total food in the data class
            return foodData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SearchCell
        if searching{
            cell.lblFoodName.text = searchFood[indexPath.row].name
            cell.imageFood.image = searchFood[indexPath.row].image
        } else {
            cell.lblFoodName.text = foodData[indexPath.row].name
            cell.imageFood.image = foodData[indexPath.row].image
        }
        tableView.rowHeight = 94
        return cell
    }

}

extension SearchViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchFood = foodData.filter({$0.name.lowercased().contains(searchText.lowercased())})
        searching = true
        if searchBar.text == "" {
            searching = false
        }
        tabelSearch.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tabelSearch.reloadData()
    }
    
}
