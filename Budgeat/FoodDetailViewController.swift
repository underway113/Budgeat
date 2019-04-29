//
//  FoodDetailViewController.swift
//  Budgeat
//
//  Created by William Inx on 25/04/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import UIKit

class FoodDetailViewController: UIViewController {
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismissCustom()
    }
    
    func dismissCustom() {
        let transition: CATransition = CATransition()
        transition.duration = 0.2
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window!.layer.add(transition, forKey: nil)
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var dollarLabel: UILabel!
    
    @IBOutlet weak var foodDetailImage: UIImageView!
    
    var passedData:Food?
    var foodName:String?
    var restaurantList:[(rest :Restaurant, food : Food)] = []
    var minPrice:[String:Int] = [:]
    var maxPrice:[String:Int] = [:]
    
    func loadRestaurantList(){
        for restaurant in zone_GOP.restaurants{
            for food in restaurant.foods{
                if passedData?.name.lowercased() == food.name.lowercased(){
                    restaurantList.append((restaurant, food))
                }
                
                if minPrice[food.name] != nil && maxPrice[food.name] != nil{
                    if minPrice[food.name] ?? Int(UInt16.max) > food.price {
                        minPrice[food.name] = food.price
                    }
                    
                    if maxPrice[food.name] ?? Int(UInt16.min) < food.price {
                        maxPrice[food.name] = food.price
                    }
                }
                else {
                    minPrice[food.name] = food.price
                    maxPrice[food.name] = food.price
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadRestaurantList()
        
        print(restaurantList)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let oldestUser = restaurantList.min { $0.food.price < $1.food.price }
        //        print("Passed Data = " + passedData?.name)
        categoryLabel.text = passedData?.name
        foodDetailImage.image = passedData?.image
        
        let categoryName:String = categoryLabel.text ?? "Not Found"
        let minimumBudget:Int = minPrice[categoryName]!
        let maximumBudget:Int = maxPrice[categoryName]!
        if minimumBudget != maximumBudget {
            priceLabel.text = "Rp.\(minimumBudget) - Rp.\(maximumBudget)"
        }
        else {
            priceLabel.text = "Rp.\(minimumBudget)"
        }
        
//        categoryLabel.text = selectedName
//        priceLabel.text = "Rp. \(passedData?.price ?? 0)"
//        foodDetailImage.image = selectedPic

        switch passedData?.price {
        case _ where passedData?.price ?? 0 > 0 && passedData?.price ?? 0 <= 20_000:
            dollarLabel.text = "$"
            dollarLabel.textColor = UIColor(red: 0.1, green: 0.8, blue: 0.2, alpha: 1)
        case _ where passedData?.price ?? 0 > 20_000 && passedData?.price ?? 0 <= 40_000:
            dollarLabel.text = "$$"
            dollarLabel.textColor = UIColor(red: 0.9, green: 0.39, blue: 0, alpha: 1)
        case _ where passedData?.price ?? 0 > 40_000:
            dollarLabel.text = "$$$"
            dollarLabel.textColor = UIColor(red: 0.95, green: 0.15, blue: 0.05, alpha: 1)
        default:
            dollarLabel.text = "?"
            dollarLabel.textColor = UIColor(red: 20, green: 20, blue: 20, alpha: 0.1)
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        dismissCustom()
    }
    
}


extension FoodDetailViewController: UITableViewDataSource ,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "restaurantCell")
        cell?.textLabel?.text = restaurantList[indexPath.row].rest.name
        cell?.detailTextLabel?.text = "Rp. \(restaurantList[indexPath.row].food.price)"
        return cell!
    }
    
    
}
