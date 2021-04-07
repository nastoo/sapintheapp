//
//  ArretViewController.swift
//  Sapin
//
//  Created by Nathan Stooss on 01/04/2021.
//  Copyright © 2021 Jael Beining. All rights reserved.
//

import UIKit
import MapKit

class ArretViewController: UIViewController, UITableViewDataSource {
    
    weak var delegate:ViewController!
    var arretId:String = ""
    var arretLatitude:Double = 0.0
    var arretLongitude:Double = 0.0
    var kindOfPlace:String = ""
    
    var tableViewData: [String] = [""]
    
    var api = API()
    
    // Quel arrêt ?
    @IBOutlet var textArretId:UITextView?
    
    // Boutons
    @IBOutlet var buttonOuManger:UIButton?
    @IBOutlet var buttonOuBoire:UIButton?
    @IBOutlet var buttonOuVoirUnFilm:UIButton?
    @IBOutlet var buttonToutVoir:UIButton?
    @IBOutlet var tableView:UITableView?
    
    
    // Charge la table view
    @IBAction func loadTableViewAll() {
        tableView?.isHidden = false
        self.kindOfPlace = "catering.restaurant,catering.pub,entertainment.cinema"
        displayPlacesCallingApi()
        self.refreshTableView()

    }
    
    @IBAction func loadTableViewSingleManger() {
        tableView?.isHidden = false
        self.kindOfPlace = "catering.restaurant"
        displayPlacesCallingApi()
        self.refreshTableView()

    }
    
    @IBAction func loadTableViewSingleBoire() {
        tableView?.isHidden = false
        self.kindOfPlace = "catering.pub"
        displayPlacesCallingApi()
        self.refreshTableView()

    }
    
    @IBAction func loadTableViewSingleVoir() {
        tableView?.isHidden = false
        displayPlacesCallingApi()
        self.kindOfPlace = "entertainment.cinema"
        self.refreshTableView()

        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // On set le texte du haut en fonction du paramètre passé lors du push de la vue
        textArretId?.text = arretId
        
        // On set les boutons
        buttonOuManger?.layer.cornerRadius = 20.0
        buttonOuBoire?.layer.cornerRadius = 20.0
        buttonOuVoirUnFilm?.layer.cornerRadius = 20.0
        buttonToutVoir?.layer.cornerRadius = 20.0
        
        
        // Appel de l'API places
        //displayPlacesCallingApi()
        
        
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView?.dataSource = self
        tableView?.isHidden = true
        
        
    }
    // Appel de l'API places
    func displayPlacesCallingApi() {
        api.getPlaces(completion: { places in
            self.tableViewData = []
            var details: PlacesDetails?
            var tailleTableau:Int = 0;
            if ((places!.features.count) != 0) {
                tailleTableau = places!.features.count
            } else {
                tailleTableau = 0;
            }
            print(tailleTableau)
            if(tailleTableau > 1) {
                for i in 0...tailleTableau-1 {
                    details = places!.features[i].properties
                    self.tableViewData.append(details!.name)
                }
            } else {
                self.tableViewData.append("Il n'y a rien à afficher...")
            }
            self.refreshTableView()

            
        }, latitude: self.arretLatitude, longitude: self.arretLongitude, kindOfPlace: self.kindOfPlace)
    }
    
    func refreshTableView() {
        DispatchQueue.main.async {
            self.tableView!.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell",
                                                 for: indexPath)
        cell.textLabel?.text = self.tableViewData[indexPath.row]
        return cell
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
