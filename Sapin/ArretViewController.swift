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
    @IBAction func loadTableViewManger() {
        tableView?.isHidden = false
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
        
        api.getPlaces(completion: { places in
            var details: [PlacesDetails]?
            details = places!.features[0].properties
            DispatchQueue.main.async {
                print(details)
            }
            
        })
        
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView?.dataSource = self
        tableView?.isHidden = true


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
    
    var tableViewData = ["Lorem ipsum", "Dolor", "Sint Ament", "Lor"]
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
