//
//  SignUpViewController.swift
//  HallPass
//
//  Created by Elias Perez on 11/17/15.
//  Copyright © 2015 Elias Perez. All rights reserved.
//

import UIKit
import Alamofire

class SignUpViewController: UIViewController{
    
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
        let params      = [ "email": email_address.text!, "password": password.text!, "full_name": full_name.text!]
        
        let modal = UIView( frame: CGRect(x: self.view.frame.midX - 90, y: self.view.frame.midY - 25 , width: 180, height: 50))
        self.show_activity_indicator("Signing in...", true, modal: modal)
        
        HallPassService.sign_up(params) { (let new_user) in
            if let _ = new_user {
                self.dismissViewControllerAnimated(true, completion: nil)
            }
            else {
                self.dismiss_activity_indicator(modal)
                self.alert("Sign up failed!", message: "Connection Failed")
            }
        }
    }
    
    
    @IBAction func go_to_login(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
