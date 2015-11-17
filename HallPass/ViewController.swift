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
        super.performSegueWithIdentifier("go_to_login", sender: self)
    }

    @IBAction func logout(sender: UIButton) {
        super.performSegueWithIdentifier("go_to_login", sender: self)
    }
}
