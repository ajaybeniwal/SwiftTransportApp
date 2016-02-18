//
//  BusTimingViewController.swift
//  TransitFare
//
//  Created by ajaybeniwal203 on 16/2/16.
//  Copyright © 2016 ajaybeniwal203. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


class BusTimingViewController: UIViewController, CLLocationManagerDelegate {
   var locationManager: CLLocationManager!
    var map:MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        createMapView()
        locationManager = CLLocationManager()
        locationManager.delegate = self;
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func createMapView(){
        self.map = MKMapView()
        self.map.showsUserLocation = true
        self.view.addSubview(self.map)
        self.map.snp_makeConstraints{ (make) -> Void in
            make.edges.equalTo(self.view)
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       let location = locations.last! as CLLocation
       let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
       let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        self.map.setRegion(region, animated: true)
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        self.map.showsUserLocation = (status == .AuthorizedAlways)
    }

  

}
