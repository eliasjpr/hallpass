//
//  LoginViewController.swift
//  HallPass
//
//  Created by Elias Perez on 11/17/15.
//  Copyright © 2015 Elias Perez. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var email_address: UITextField!
    @IBOutlet var password: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func signin_user(sender: UIButton) {
        
        // Authenticate user
        
    }
}
