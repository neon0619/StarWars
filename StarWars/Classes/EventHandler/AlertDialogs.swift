//
//  AlertDialogs.swift
//  OneSwiftPay
//
//  Created by --=_t0tep_=-- on 09/10/2015.
//  Copyright © 2015 OneNetworkEcommerce. All rights reserved.
//

import Foundation
import UIKit

class AlertDialogs: NSObject {
    
    
    ///////  alertController for ViewController with PARAMETERS /////////////
    func showLazyAlertController(title: String, msg: String, viewController: UIViewController) -> Void {
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .Alert)
        let ok = UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            
            viewController.navigationController?.dismissViewControllerAnimated(true, completion: nil)
            
        })
        alertController.addAction(ok)
        
        viewController.presentViewController(alertController, animated: true, completion: nil)
    }
    
}