//
//  ViewController.swift
//  Sapin
//
//  Created by Jael Beining on 11/02/2021.
//  Copyright © 2021 Jael Beining. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    var api = API()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        api.getArretCoord()
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.mapType = .mutedStandard
        mapView.showsPointsOfInterest = false
        
        if #available(iOS 13.0, *){
            self.overrideUserInterfaceStyle = .dark
        }
        
        let center = CLLocationCoordinate2D(latitude: 45.185401, longitude:5.73)
        centerMap(onLocation: center)
    }
    
    func centerMap(onLocation location: CLLocationCoordinate2D) {
        let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 5000, longitudinalMeters: 5000)
        mapView.setRegion(mapView.regionThatFits(region), animated: true)
    }
   
    
}

