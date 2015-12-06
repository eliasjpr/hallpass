//
//  StudentsViewController.swift
//  HallPass
//
//  Created by Elias Perez on 12/6/15.
//  Copyright © 2015 Elias Perez. All rights reserved.
//

import UIKit

class StudentsViewController: UIViewController, UITableViewDataSource {
    
    let students = [("user_avatar", "Elias Perez"), ("user_avatar", "Lauren Mantone"), ("user_avatar", "Counseling"), ("user_avatar", "Meeting"), ("user_avatar", "Nurse")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let preferences: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let authenticated: Bool = preferences.boolForKey("authenticated") as Bool
        
        if(!authenticated){
            super.performSegueWithIdentifier("go_to_login", sender: self)
        }
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("student_cell", forIndexPath: indexPath)
        let (student_avatar, student_name) = students[indexPath.row]
        
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel!.text = student_name
        cell.separatorInset  = UIEdgeInsetsZero
        let icon             = UIImage(named: student_avatar)
        cell.imageView?.image = icon
        
        return cell
    }


}
