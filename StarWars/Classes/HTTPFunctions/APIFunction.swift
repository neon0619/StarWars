//
//  APIFunction.swift
//  OneSwiftPay
//
//  Created by --=_t0tep_=-- on 13/10/2015.
//  Copyright © 2015 OneNetworkEcommerce. All rights reserved.
//

import Foundation
import UIKit


struct APIurls {
    
    let baseURL = "https://swapi.co/api/"
    
}


class APIFunction: NSObject {
    
    func getTypeInfo(url: String, type: String, postCompleted: (arrayItems: [NSDictionary]) ->()) {
        
        let requestURL = NSURL(string: url+type)!
        let request = NSMutableURLRequest(URL: requestURL)
        request.HTTPMethod = "GET"
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request) { data, response, error in
            

            
            guard data != nil else {
                print("no data found: \(error!)")
                postCompleted(arrayItems: [NSDictionary]())
                return
            }
            do {
                if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary {

                    
                    if let results = json["results"] as? [NSDictionary] {
                        postCompleted(arrayItems: results)
                    }else {
                       postCompleted(arrayItems: [NSDictionary]())
                    }
                    
                } else {
                    let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)    // No error thrown, but not NSDictionary
                    print("Error could not parse JSON: \(jsonStr)")
                    postCompleted(arrayItems: [NSDictionary]())
                }
            } catch let parseError {
                print(parseError)                                                          // Log the error thrown by `JSONObjectWithData`
                let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print("Error could not parse JSON: '\(jsonStr)'")
                postCompleted(arrayItems: [NSDictionary]()) 
            }
        }
        task.resume()
    }




}




