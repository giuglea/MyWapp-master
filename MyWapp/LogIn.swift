//
//  LogIn.swift
//  MyWapp
//
//  Created by Andrei Giuglea on 18/03/2019.
//  Copyright © 2019 Andrei Giuglea. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class LogIn: UIViewController{
    
    
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    @IBOutlet weak var logInUser: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInUser.layer.cornerRadius = 10
    }
    
   
    
    
    //TODO: email verification
    
    @IBAction func logInProcess(_ sender: Any) {
        Auth.auth().signIn(withEmail: userEmail.text!, password: userPassword.text!) { (user, error) in
            if error != nil{
                print("Log in succesful!!")
                self.performSegue(withIdentifier: "LogToChat", sender: self)
            }
        }
    }
}
