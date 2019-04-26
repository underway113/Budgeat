//
//  Restaurant.swift
//  Budgeat
//
//  Created by William Inx on 26/04/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import Foundation
import UIKit

class Restaurant {
    
    var name:String
    var description:String
    var priceRange:Int
    var foods:[Food]
    var image:UIImage
    var latitude:Double
    var longtitude:Double
    var distance:Double
    
    init(name:String, description:String, priceRange:Int, foods:[Food], image:UIImage, latitude:Double, longtitude:Double, distance:Double) {
        self.name = name
        self.description = description
        self.priceRange = priceRange
        self.foods = foods
        self.image = image
        self.latitude = latitude
        self.longtitude = longtitude
        self.distance = distance
    }
}
