//
//  Food.swift
//  Budgeat
//
//  Created by William Inx on 26/04/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import Foundation
import UIKit

class Food {
    var name:String
    var description:String
    var price:Int
    var image:UIImage
    
    init(name:String, description:String, price:Int, image:UIImage) {
        self.name = name
        self.description = description
        self.price = price
        self.image = image
    }
}
