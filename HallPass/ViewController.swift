//
//  ViewController.swift
//  HallPass
//
//  Created by Elias Perez on 11/17/15.
//  Copyright © 2015 Elias Perez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var username: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning() 
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let preferences: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let authenticated: Bool = preferences.boolForKey("authenticated") as Bool
        
        if(authenticated){
            self.username.text = preferences.valueForKey("full_name")  as? String
        }
        else {
            super.performSegueWithIdentifier("go_to_login", sender: self)
        }
    }

    @IBAction func logout(sender: UIButton) {
        let appDomain = NSBundle.mainBundle().bundleIdentifier
        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain!)
        super.performSegueWithIdentifier("go_to_login", sender: self)
    }
}
