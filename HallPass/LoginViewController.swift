//
//  LoginViewController.swift
//  HallPass
//
//  Created by Elias Perez on 11/17/15.
//  Copyright © 2015 Elias Perez. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController  {
    
    
    @IBOutlet weak var password_field: UITextField!
    @IBOutlet weak var email_address: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func signin_user(sender: UIButton) {
        let params = ["email": email_address.text!, "password": password_field.text!]
        
        let modal = UIView( frame: CGRect(x: self.view.frame.midX - 90, y: self.view.frame.midY - 25 , width: 180, height: 50))
        self.show_activity_indicator("Signing in...", true, modal: modal)
        
        HallPassService.login(params) { (let sign_in_user) in
            if let _ = sign_in_user {
                self.dismissViewControllerAnimated(true, completion: nil)
            }
            else {
                self.dismiss_activity_indicator(modal)
                self.alert("Sign in failed!", message: "Connection Failed")
            }
        }
        
        
    }
    
}
