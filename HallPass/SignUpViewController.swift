//
//  SignUpViewController.swift
//  HallPass
//
//  Created by Elias Perez on 11/17/15.
//  Copyright © 2015 Elias Perez. All rights reserved.
//

import UIKit
import Alamofire

class SignUpViewController: UIViewController, UITextFieldDelegate{
    
    let BASE_URL: String = "https://hall-pass.herokuapp.com/"
    
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
        let url         = BASE_URL + "auth/register"
        let preferences: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        // Validate inputs
        if( is_valid() ){
            let params      = [ "email": email_address.text!, "password": password.text!, "full_name": full_name.text!]
            
            // Authenticate user
            Alamofire.request(.POST, url , parameters: params, encoding:.JSON)
                .responseJSON{ response in
                    
                    guard let user = response.result.value else {
                        print(response.result)
                        let alertView:UIAlertView = UIAlertView()
                        alertView.title = "Sign up Failed!"
                        alertView.message = "Connection Failed"
                        alertView.delegate = self
                        alertView.addButtonWithTitle("OK")
                        alertView.show()
                        return
                    }
                    
                    
                    
                    preferences.setObject( user["full_name"], forKey: "full_name")
                    preferences.setObject( user["email"], forKey: "email")
                    preferences.setObject( user["phone_number"], forKey: "phone_number")
                    preferences.setObject( user["role"], forKey: "role")
                    preferences.setObject( user["school"], forKey: "school")
                    preferences.setObject( user["auth"]!!["token"], forKey: "token")
                    
                    preferences.setBool( true, forKey: "authenticated")
                    
                    preferences.synchronize()
                    
                    self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
    }
    
    
    @IBAction func go_to_login(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func is_valid() -> Bool {
        if( (email_address.text == "") || (password.text == "" ) || (password.text == "" ) || (school_name.text == "" ) ){
            let alertView:UIAlertView = UIAlertView()
            alertView.title = "Sign in Failed!"
            alertView.message = "Form has invalid entries"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
            
            return false
        }
        return true
    }
   
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        let nextTage=textField.tag+1;
        // Try to find next responder
        let nextResponder=textField.superview?.viewWithTag(nextTage) as UIResponder!
        
        if (nextResponder != nil){
            // Found next responder, so set it.
            nextResponder?.becomeFirstResponder()
        }
        else
        {
            // Not found, so remove keyboard
            textField.resignFirstResponder()
        }
        return false // We do not want UITextField to insert line-breaks.
    }
}
