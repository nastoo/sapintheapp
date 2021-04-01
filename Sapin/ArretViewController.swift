//
//  ArretViewController.swift
//  Sapin
//
//  Created by Nathan Stooss on 01/04/2021.
//  Copyright © 2021 Jael Beining. All rights reserved.
//

import UIKit
import MapKit

class ArretViewController: UIViewController {

    weak var delegate:ViewController!
    var arretId:String = ""
    
    // Quel arrêt ?
    @IBOutlet var textArretId:UITextView?
    
    // Boutons
    @IBOutlet var buttonOuManger:UIButton?
    @IBOutlet var buttonOuBoire:UIButton?
    @IBOutlet var buttonOuVoirUnFilm:UIButton?
    @IBOutlet var buttonToutVoir:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // On set le texte du haut en fonction du paramètre passé lors du push de la vue
        textArretId?.text = arretId
        
        // On set les boutons
        buttonOuManger?.layer.cornerRadius = 20.0
        buttonOuBoire?.layer.cornerRadius = 20.0
        buttonOuVoirUnFilm?.layer.cornerRadius = 20.0
        buttonToutVoir?.layer.cornerRadius = 20.0
        // Do any additional setup after loading the view.
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
