//
//  LocationsMarkerView.swift
//  Budgeat
//
//  Created by Owen Prasetya on 25/04/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import MapKit
import UIKit

class LocationsMarkerView: MKMarkerAnnotationView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override var annotation: MKAnnotation? {
        willSet {
            guard let locations = newValue as? Locations else { return }
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
            // Change marker color; but seems not useful since there is only 1 type of place
            //markerTintColor = locations.markerTintColor
            
            //Callout use initial alphabet
            glyphText = String(locations.locationName.first!)
        }
    }

}
