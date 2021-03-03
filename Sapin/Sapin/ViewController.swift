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
    
    var currentCoordinate : CLLocationCoordinate2D!
    var oldCoordinate : CLLocationCoordinate2D!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        api.getTag(completion: { tags in

            var valuesTable: [CLLocationCoordinate2D]?
            valuesTable = tags!.features[0].geometry.coordinates
            DispatchQueue.main.async {
                self.createIti(location: valuesTable!)
            }
            
        
        })
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.mapType = .mutedStandard
        mapView.showsPointsOfInterest = false
        
        if #available(iOS 13.0, *) {
            self.overrideUserInterfaceStyle = .dark
        }
        
        let center = CLLocationCoordinate2D(latitude: 45.185401, longitude:5.73)
        centerMap(onLocation: center)
    }
    
    // Couleurs+ personnalisatin
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(polyline: overlay as! MKPolyline)
        renderer.strokeColor = UIColor(red: 0.76, green: 0.00, blue: 0.47, alpha: 1.00)
        renderer.lineWidth = 3.0
        return renderer
    }
    
    func centerMap(onLocation location: CLLocationCoordinate2D) {
        let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 5000, longitudinalMeters: 5000)
        mapView.setRegion(mapView.regionThatFits(region), animated: true)
    }
    
    
    func createIti(location:[CLLocationCoordinate2D]){
        
        let trajet = MKPolyline(coordinates: location, count: location.count)
        mapView.addOverlay(trajet)
    }
    
    
}

