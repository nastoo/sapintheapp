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
        
        //Appel première API
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
        
        
        
        //Appel Seconde API
        api.getArret(completion: { arrets in
            var value: [Feature_2]?
            value = arrets?.features
           
            self.api.getTag(completion: { tags in
                
                var name: [String]!
                name = tags!.features[0].properties.ZONES_ARRET
                self.filterAndRefreshMap(name: name, value: value!)
            
            })

            
        })
    }
    func filterAndRefreshMap (name:[String?], value:[Feature_2]) {
      
        var iteration:Int = 0
        name.forEach { row in
            
            let arret:String? = name[iteration]
            let arretSolo = value.filter { $0.properties.CODE == arret }
            
            let latitude = arretSolo[0].geometry.coordinates[1]
            let longitude = arretSolo[0].geometry.coordinates[0]
            
            // instantiation de l'annotation
            
            let annotation = CustomAnnotation()
            annotation.id = arret
            annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            annotation.title = arret
            
            
            mapView.addAnnotation(annotation)
            
            iteration = iteration + 1
            print(arretSolo)
        }
    
    }
    
    // Test de l'annotation, pour pouvoir ensuite faire en sorte d'afficher quelque chose en cas de touch
    // Modifie juste la forme, possible de l'elenver
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is CustomAnnotation {
            let pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: String(annotation.hash))

            let rightButton = UIButton(type: .infoDark)
            rightButton.tag = annotation.hash
            

            pinView.animatesDrop = true
        
           
            return pinView

        } else {
            return nil
        }
    }
    
    // Lorsqu'on touche une annotation
    var selectedAnnotation: MKPointAnnotation?

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        self.selectedAnnotation = view.annotation as? MKPointAnnotation
        
        // On push ArretViewController
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ArretViewController") as! ArretViewController
        nextViewController.arretId = self.selectedAnnotation!.title!
        nextViewController.arretLatitude = self.selectedAnnotation!.coordinate.latitude
        nextViewController.arretLongitude = self.selectedAnnotation!.coordinate.longitude
        self.present(nextViewController, animated:true, completion:nil)
        
        
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

