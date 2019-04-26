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
    
    var searchFood = [String]()
    var searching = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchBar.searchBarStyle = UISearchBar.Style.minimal
        searchBar.placeholder = " Search..."
        searchBar.showsCancelButton = false
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
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
            return foodData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if searching{
            cell?.textLabel?.text = searchFood[indexPath.row]
        } else {
            cell?.textLabel?.text = foodData[indexPath.row]
        }
        
        return cell!
    }
    
}

extension SearchViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchFood = foodData.filter({$0.lowercased().contains(searchText.lowercased())})
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
