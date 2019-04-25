//
//  MapViewController.swift
//  Budgeat
//
//  Created by William Inx on 25/04/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    var userLocation:CLLocation = CLLocation(latitude: -6.222979, longitude: 106.652451)
    let regionRadius: CLLocationDistance = 1000
    let locationsMark = [Locations(title: "Mall Alam Sutera", locationName: "Mall Alam Sutera", locationDesc: "Mall located at alam sutera.", coordinate: CLLocationCoordinate2D(latitude: -6.222979, longitude: 106.652451), image: #imageLiteral(resourceName: "food4")) , Locations(title: "Starbucks Binus", locationName: "Starbucks Binus", locationDesc: "Starbucks located inside binus.", coordinate: CLLocationCoordinate2D(latitude: -6.223795, longitude: 106.648531), image: #imageLiteral(resourceName: "food3")), Locations(title: "Flavour Bliss", locationName: "Flavour Bliss", locationDesc: "assortments of restaurants are available here, ranging from western to asian foods.", coordinate: CLLocationCoordinate2D(latitude: -6.242139, longitude: 106.651646), image: #imageLiteral(resourceName: "food2")), Locations(title: "Living World", locationName: "Living World", locationDesc: "mall of many places filled with many restaurants, market and many more!", coordinate: CLLocationCoordinate2D(latitude: -6.244291, longitude: 106.653468), image: #imageLiteral(resourceName: "food1")), Locations(title: "Spoke Bistro", locationName: "Spoke Bistro", locationDesc: "a place for you to chill while eating their delicious meals.", coordinate: CLLocationCoordinate2D(latitude: -6.238425, longitude: 106.658596), image: #imageLiteral(resourceName: "food4"))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self //as? CLLocationManagerDelegate
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        // Initialize map
        mapView.register(LocationsMarkerView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        //mapView.delegate = self as? MKMapViewDelegate
        mapView.addAnnotations(locationsMark)
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        userLocation = CLLocation(latitude: locValue.latitude, longitude: locValue.longitude)
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
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
