//
//  helpers.swift
//  HallPass
//
//  Created by Elias Perez on 12/7/15.
//  Copyright © 2015 Elias Perez. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func alert( title:String, message: String){
        let alertView:UIAlertView = UIAlertView()
        alertView.title         = title
        alertView.message       = message
        alertView.delegate      = self
        alertView.addButtonWithTitle("OK")
        alertView.show()
    }
    
    func show_activity_indicator( title: String, _ indicator:Bool, modal: UIView) {
        let view  = self.view
        
        modal.layer.cornerRadius = 15
        modal.backgroundColor = UIColor(white: 0, alpha: 0.7)
        
        let label = UILabel( frame: CGRect(x: 50, y: 0, width: 200, height: 50) )
        label.text = title
        label.textColor = UIColor.whiteColor()
        
        
        
        if indicator {
            let activity_indicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.White)
            activity_indicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
            activity_indicator.startAnimating()
            modal.addSubview(activity_indicator)
        }
        
        modal.addSubview(label)
        view.addSubview(modal)
    }
    
    func dismiss_activity_indicator(modal: UIView){
        modal.removeFromSuperview()
    }
    
   
}

extension String {

    func md5() -> String {
        var digest = [UInt8](count: Int(CC_MD5_DIGEST_LENGTH), repeatedValue: 0)
        if let data = self.dataUsingEncoding(NSUTF8StringEncoding) {
            CC_MD5(data.bytes, CC_LONG(data.length), &digest)
        }
        
        var digestHex = ""
        for index in 0..<Int(CC_MD5_DIGEST_LENGTH) {
            digestHex += String(format: "%02x", digest[index])
        }
        
        return digestHex
    }

}