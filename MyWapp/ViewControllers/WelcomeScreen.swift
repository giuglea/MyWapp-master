//
//  ViewController.swift
//  MyWapp
//
//  Created by Andrei Giuglea on 18/03/2019.
//  Copyright © 2019 Andrei Giuglea. All rights reserved.
//

import UIKit
import Firebase

class WelcomeScreen: UIViewController {

    
    @IBOutlet weak var logInUser: UIButton!
    @IBOutlet weak var registerUser: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInUser.layer.cornerRadius = 10
        registerUser.layer.cornerRadius = 10
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

