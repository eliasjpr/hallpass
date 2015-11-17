//
//  SignUpViewController.swift
//  HallPass
//
//  Created by Elias Perez on 11/17/15.
//  Copyright © 2015 Elias Perez. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
  
    @IBOutlet weak var full_name: UITextField!
    @IBOutlet weak var email_address: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var school_name: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
  
    @IBAction func signup(sender: UIButton) {
    }
    @IBAction func go_to_login(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
   
    
}
