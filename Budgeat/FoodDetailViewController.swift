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
    //var foodPrice: Int
    var restaurantList:[(rest :Restaurant, food : Food)] = []
    
    func loadRestaurantList(){
        for restaurant in zone_GOP.restaurants{
            for food in restaurant.foods{
                    if passedData?.name.lowercased() == food.name.lowercased(){
                        restaurantList.append((restaurant, food))
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
        
        //        print("Passed Data = " + passedData?.name)
        categoryLabel.text = passedData?.name
        foodDetailImage.image = passedData?.image
        priceLabel.text = "\(passedData?.price ?? 0)"
        
        //        categoryLabel.text = selectedName
        // priceLabel.text = "Rp." + receivedPrice!
        //        foodDetailImage.image = selectedPic
        
        //        if Int(receivedPrice!) == nil {
        //            intReceivedPrice = 0
        //        }
        //        else {
        //            intReceivedPrice = Int(receivedPrice!)
        //        }
        //
        //        switch intReceivedPrice {
        //        case _ where intReceivedPrice! > 0 && intReceivedPrice! <= 20_000:
        //            dollarLabel.text = "$"
        //            dollarLabel.textColor = UIColor(red: 0.15, green: 0.9, blue: 0.2, alpha: 1)
        //        case _ where intReceivedPrice! > 20_000 && intReceivedPrice! <= 40_000:
        //            dollarLabel.text = "$$"
        //            dollarLabel.textColor = UIColor(red: 0.6, green: 0.4, blue: 0.4, alpha: 1)
        //        case _ where intReceivedPrice! > 40_000:
        //            dollarLabel.text = "$$$"
        //            dollarLabel.textColor = UIColor(red: 1, green: 0.1, blue: 0.05, alpha: 1)
        //        default:
        //            dollarLabel.text = "!"
        //            dollarLabel.textColor = UIColor(red: 20, green: 20, blue: 20, alpha: 0.1)
        //        }
        
        // Do any additional setup after loading the view.
    }
    
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        dismissCustom()
    }
    //        else if gesture.direction == UISwipeGestureRecognizer.Direction.left {
    //            print("Swipe Left")
    //        }
    
    
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
