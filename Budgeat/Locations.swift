//
//  Locations.swift
//  Budgeat
//
//  Created by Owen Prasetya on 25/04/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import UIKit
import MapKit

class Locations: NSObject, MKAnnotation {
    
    let title : String?
    let locationName : String
    let locationDesc : String
    let coordinate : CLLocationCoordinate2D
    let image : UIImage
    
    init(title : String ,locationName : String , locationDesc : String , coordinate : CLLocationCoordinate2D , image : UIImage) {
        self.title = title
        self.locationName = locationName
        self.locationDesc = locationDesc
        self.coordinate = coordinate
        self.image = image
        super.init()
    }
    
    var subtitle: String? {
        return locationDesc
    }
}
