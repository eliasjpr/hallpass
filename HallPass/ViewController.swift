//
//  ViewController.swift
//  HallPass
//
//  Created by Elias Perez on 11/17/15.
//  Copyright © 2015 Elias Perez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var username: UILabel!
    
    let type_of_passes = [("bathroom", "Bathroom"), ("locker", "Locker"), ("counseling", "Counseling"), ("meeting", "Meeting"), ("nurse", "Nurse")]
    
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
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return type_of_passes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("hall_pass_type", forIndexPath: indexPath)
        let (pass_type, pass_name) = type_of_passes[indexPath.row]
        
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel!.text = pass_name
        cell.separatorInset  = UIEdgeInsetsZero
        let icon             = UIImage(named: pass_type)
        cell.imageView?.image = icon
        
        return cell
    }
    

    @IBAction func logout(sender: UIButton) {
        let appDomain = NSBundle.mainBundle().bundleIdentifier
        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain!)
        super.performSegueWithIdentifier("go_to_login", sender: self)
    }
}
