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

class MapViewController: UIViewController,MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var detailMapView: UIView!
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailRestaurant: UILabel!
    @IBOutlet weak var detailPriceRange: UITextView!
    
    var locationManager = CLLocationManager()
    var userLocation:CLLocation = CLLocation(latitude: -6.222979, longitude: 106.652451)
    let regionRadius: CLLocationDistance = 1000
    
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
        detailMapView.isHidden = true
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self //as? CLLocationManagerDelegate
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        detailMapView.alpha = 1
        
        // Initialize map
        mapView.register(LocationsMarkerView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        mapView.showsUserLocation = true
        mapView.delegate = self
        
        mapView.userTrackingMode = .follow
        
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
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("asd")
        if control == view.rightCalloutAccessoryView {
            print("button tapped")
        }
        print("tes")
        detailMapView.isHidden = false
        
        
        let locationName = (view.annotation?.title as? String)
        for location in locationsMark {
            if locationName == location.title {
                detailImage.image = location.image
                detailRestaurant.text = location.locationName
                detailPriceRange.text = location.locationDesc
            }
        }
    }
    
    //Deselect marker
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        detailMapView.isHidden = true
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
