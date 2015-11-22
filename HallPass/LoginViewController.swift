//
//  LoginViewController.swift
//  HallPass
//
//  Created by Elias Perez on 11/17/15.
//  Copyright © 2015 Elias Perez. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    
    let BASE_URL: String = "https://hall-pass.herokuapp.com/"
    
    @IBOutlet weak var password_field: UITextField!
    @IBOutlet weak var email_address: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   
    

    @IBAction func signin_user(sender: UIButton) {
        
        //let url = BASE_URL + "auth/login"
        let params = [ "email": email_address.text!, "password": password_field.text! ]
        let url = BASE_URL + "auth/login"
        let preferences: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let is_valid = validateLoginInputs();
        // Validate inputs
        if(  is_valid ){
            // Authenticate user
            Alamofire.request(.POST, url , parameters: params, encoding:.JSON)
                .responseJSON{ response in
                    
                    guard let auth = response.result.value else {
                        print(response.result)
                        let alertView:UIAlertView = UIAlertView()
                        alertView.title = "Sign in Failed!"
                        alertView.message = "Connection Failed"
                        alertView.delegate = self
                        alertView.addButtonWithTitle("OK")
                        alertView.show()
                        return
                    }
                    
                    let user = auth["user"]
                    let full_name = user!!["full_name"]
                    
                    preferences.setObject( full_name, forKey: "full_name")
                    preferences.setBool( true, forKey: "authenticated")
                    preferences.synchronize()
                    
                    self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
    }
    
    func validateLoginInputs() ->Bool {
        if( (email_address.text == "") || (password_field.text == "" ) ){
            let alertView:UIAlertView = UIAlertView()
            alertView.title = "Sign in Failed!"
            alertView.message = "Please enter Username and Password"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
            
            return false
        }
        return true
    }
    
    

}
