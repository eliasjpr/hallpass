//
//  student.swift
//  HallPass
//
//  Created by Elias Perez on 12/7/15.
//  Copyright © 2015 Elias Perez. All rights reserved.
//

import Foundation
import Alamofire


struct User {
    
    
    var uid: Int?
    var full_name: String?
    var email: String?
    var password: String?
    var grade: Int?
    var school: String?
    var authenticated: Bool?
    
    init(){
        let session: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        self.uid            = session.valueForKey("uid")  as? Int
        self.full_name      = session.valueForKey("full_name")  as? String
        self.email          = session.valueForKey("email")  as? String
        self.password       = session.valueForKey("password")  as? String
        self.grade          = session.valueForKey("grade")  as? Int
        self.school         = session.valueForKey("school")  as? String
        self.authenticated  = session.boolForKey("authenticated") as Bool
    }
    
    init(full_name: String, email: String, password: String, grade: Int, school: String){
        self.full_name  = full_name
        self.email      = email
        self.password   = password
        self.grade      = grade
        self.school     = school
    }
    
    
    
    func is_logged_in() -> Bool {
        return  self.authenticated!
    }
    
    static func set_session(payload: JSON) -> User?{
        let preferences: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        preferences.setObject( payload["user"]["id"].intValue , forKey: "uid")
        preferences.setObject( payload["user"]["full_name"].stringValue , forKey: "full_name")
        preferences.setObject( payload["user"]["email"].stringValue , forKey: "email")
        preferences.setObject( payload["user"]["password"].stringValue , forKey: "password")
        preferences.setObject( payload["user"]["grade"].int , forKey: "grade")
        preferences.setObject( payload["user"]["school"].stringValue , forKey: "school")
        
        preferences.setBool( true, forKey: "authenticated")
        preferences.synchronize()
        
        return User.init()
    }
    
    
    static func set_user( payload: JSON) -> User? {
        
        let preferences: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        preferences.setObject( payload["id"].intValue , forKey: "uid")
        preferences.setObject( payload["full_name"].stringValue , forKey: "full_name")
        preferences.setObject( payload["email"].stringValue , forKey: "email")
        preferences.setObject( payload["password"].stringValue , forKey: "password")
        preferences.setObject( payload["grade"].int , forKey: "grade")
        preferences.setObject( payload["school"].stringValue , forKey: "school")
        
        preferences.setBool( true, forKey: "authenticated")
        preferences.synchronize()
        
        return User.init()
    }
    
    
    
    
}