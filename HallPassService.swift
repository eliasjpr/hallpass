//
//  HallPassService.swift
//  HallPass
//
//  Created by Elias Perez on 12/9/15.
//  Copyright © 2015 Elias Perez. All rights reserved.
//

import Foundation

struct HallPassService {

    let APIToken: String?
    
    
    static func sign_up(params: NSDictionary, callback: (User?) -> Void){
        
        NetworkOperation().request("auth/register", payload: params, verb:.POST) {
            (let data) in
            
            if let response = data, let user = User.set_user(response) {
                callback(user)
            }
            else {
                callback(nil)
            }
        }
        
    }
    
    static func login( params: NSDictionary, callback: (User?)-> Void ) {
        
        NetworkOperation().request("auth/login", payload: params, verb: .POST) {
            (let data) in
            
            if let response = data, let user = User.set_session(response) {
                callback(user)
            }
            else {
                callback(nil)
            }
        }
    }
}
