//
//  ViewController.swift
//  Sapin
//
//  Created by Jael Beining on 11/02/2021.
//  Copyright © 2021 Jael Beining. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var premierTest: UIButton!
    @IBOutlet weak var top: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //top.constant = 100
    }
    
    @IBAction func showlabel(){
        //if(top.constant == 100)
        top.constant = 100
    }
    
}

