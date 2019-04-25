//
//  MapViewController.swift
//  Budgeat
//
//  Created by William Inx on 25/04/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationsMark = [Locations(title: "Mall Alam Sutera", locationName: "Mall Alam Sutera", locationDesc: "Mall located at alam sutera.", coordinate: CLLocationCoordinate2D(latitude: -6.222979, longitude: 106.652451), image: #imageLiteral(resourceName: "moasPic")) , Locations(title: "Starbucks Binus", locationName: "Starbucks Binus", locationDesc: "Starbucks located inside binus.", coordinate: CLLocationCoordinate2D(latitude: -6.223795, longitude: 106.648531), image: #imageLiteral(resourceName: "sbucksPic")), Locations(title: "Pasar 8", locationName: "Pasar 8", locationDesc: "variety of goods at a reasonable price.", coordinate: CLLocationCoordinate2D(latitude: -6.239792, longitude: 106.652107), image: #imageLiteral(resourceName: "pasar")), Locations(title: "Flavour Bliss", locationName: "Flavour Bliss", locationDesc: "assortments of restaurants are available here, ranging from western to asian foods.", coordinate: CLLocationCoordinate2D(latitude: -6.242139, longitude: 106.651646), image: #imageLiteral(resourceName: "flavorBliss")), Locations(title: "Living World", locationName: "Living World", locationDesc: "mall of many places filled with many restaurants, market and many more!", coordinate: CLLocationCoordinate2D(latitude: -6.244291, longitude: 106.653468), image: #imageLiteral(resourceName: "liviworl")), Locations(title: "Spoke Bistro", locationName: "Spoke Bistro", locationDesc: "a place for you to chill while eating their delicious meals.", coordinate: CLLocationCoordinate2D(latitude: -6.238425, longitude: 106.658596), image: #imageLiteral(resourceName: "spokeB"))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let initialLocation = CLLocation(latitude: -6.301492, longitude: 106.652992)
        centerMapOnLocation(location: initialLocation)
        // Do any additional setup after loading the view.
        
        mapView.register(LocationsMarkerView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        mapView.showsUserLocation = true
        //mapView.delegate = self as! MKMapViewDelegate
        mapView.addAnnotations(locationsMark)
    }
    
    let regionRadius: CLLocationDistance = 1000
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    //Detail click(callout)
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let locationName = (view.annotation?.title as? String)
        for location in locationsMark {
            if locationName == location.title {
                detailImage.image = location.image
                detailTitle.text = location.locationName
                detailDescription.text = location.locationDesc
                detailPeakTime.image = location.peakTime
            }
        }
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
