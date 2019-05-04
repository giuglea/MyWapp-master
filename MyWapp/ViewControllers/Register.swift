//
//  Register.swift
//  MyWapp
//
//  Created by Andrei Giuglea on 18/03/2019.
//  Copyright © 2019 Andrei Giuglea. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class Register:UIViewController{
    
    
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var userConfirmPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerButton.layer.cornerRadius = 10
       
        
    }
    
    
    @IBAction func passwordCheck(_ sender: Any) {
        
        
    }
    
    @IBAction func RegisterUser(_ sender: Any) {
//        SVProgressHUD.show()
//        Auth.auth().createUser(withEmail: userEmail.text!, password: userPassword.text!) { (user, error) in
//            if error != nil{
//                print(error!)
//                SVProgressHUD.dismiss(withDelay: 5)
//            }
//
//        else{
//            self.performSegue(withIdentifier: "RegisterToChat", sender: self)
//                SVProgressHUD.dismiss()
//        }
//        }
        performSegue(withIdentifier: "RegisterToChat", sender: self)
    }
    
    
}
