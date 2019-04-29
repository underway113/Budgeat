//
//  Zone.swift
//  Budgeat
//
//  Created by William Inx on 26/04/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import Foundation
import UIKit

class Zone {
    var name:String
    var description:String
    var restaurants:[Restaurant]
    var priceRange:Int
    var latitude:Double
    var longtitude:Double
    var image:UIImage
    
    init(name:String, description:String, restaurants:[Restaurant], priceRange:Int, latitude:Double, longtitude:Double, image:UIImage) {
        self.name = name
        self.description = description
        self.restaurants = restaurants
        self.priceRange = priceRange
        self.latitude = latitude
        self.longtitude = longtitude
        self.image = image
    }
}
