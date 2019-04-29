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
    
    //    let gopAnnotation = Locations(title: "GOP9", locationName: zone_GOP.name, locationDesc: zone_GOP.description, coordinate: CLLocationCoordinate2D(latitude: zone_GOP.latitude, longitude: zone_GOP.longtitude), image: zone_Breeze.image)
    //    let breezeAnnotation = Locations(title: "Breeze", locationName: zone_Breeze.name, locationDesc: zone_Breeze.description, coordinate: CLLocationCoordinate2D(latitude: zone_Breeze.latitude, longitude: zone_Breeze.longtitude), image: zone_Breeze.image)
    private var allAnnotations: [MKAnnotation]?
    
    func loadLocationData() {
        allAnnotations = []
        for locations in locationsMark {
            allAnnotations?.append(locations)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLocationData()
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
        //        allAnnotations = [breezeAnnotation, gopAnnotation]
        mapView.addAnnotations(allAnnotations!)
        
        //Stop Location user, better battery life
        locationManager.stopUpdatingLocation()
        
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
