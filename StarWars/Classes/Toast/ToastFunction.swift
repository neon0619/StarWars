//
//  ToastFunction.swift
//  SmartStaff
//
//  Created by t0tep on 8/1/15.
//  Copyright (c) 2015 SmartStaff. All rights reserved.
//

import Foundation
import UIKit

class ToastFunction: UIViewController {
    
    func showActivity(viewController: UIViewController) {
        viewController.view.makeToastActivity()
    }
    
    func showBlackActivity(viewController: UIViewController) {
        viewController.view.makeToastActivityBlack()
    }
    
    func hideActivity(viewController: UIViewController) {
        viewController.view.hideToastActivity()
    }
    
    func messageToast(message: String, viewController: UIViewController) {
        viewController.view.makeToast(message: message)
    }
    
}