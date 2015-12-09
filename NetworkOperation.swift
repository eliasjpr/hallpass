//
//  HallPassService.swift
//  HallPass
//
//  Created by Elias Perez on 12/9/15.
//  Copyright © 2015 Elias Perez. All rights reserved.
//

import Foundation
import Alamofire

class NetworkOperation {

    let BASE_URL: String = "https://hall-pass.herokuapp.com/"
    
    init(){
    }
    
    
    func request( resource: String, payload: NSDictionary, verb: Alamofire.Method, callback: (JSON?) -> Void ) {
        let params = payload as! [String : AnyObject]
        
        Alamofire.request( verb, self.BASE_URL + resource , parameters: params ).responseJSON{
            response in
            
            switch response.result {
                
            case .Success( let data):
                callback(JSON(data))
                
            case .Failure(let error):
                print("Request failed with error: \(error)")
                callback(nil)
            }
        }
    
    }
}