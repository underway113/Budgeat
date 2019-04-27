//
//  FoodDetailViewController.swift
//  Budgeat
//
//  Created by William Inx on 25/04/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import UIKit

class FoodDetailViewController: UIViewController {

    @IBAction func returnButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var dollarLabel: UILabel!
    
    @IBOutlet weak var foodDetailImage: UIImageView!
    
    var passedData:Food?
    var foodName:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
