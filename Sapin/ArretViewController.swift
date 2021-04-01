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
    @IBOutlet var textArretId:UITextView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textArretId?.text = arretId

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
