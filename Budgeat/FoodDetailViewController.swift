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
    var receivedImage:UIImage?
    
    @IBOutlet weak var foodDetailImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodDetailImage.image = receivedImage!

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
