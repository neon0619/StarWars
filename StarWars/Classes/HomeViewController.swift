//
//  HomeViewController.swift
//  StarWars
//
//  Created by --=_t0tep_=-- on 01/03/2016.
//  Copyright © 2016 --=_t0tep_=--. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var btnEnter: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bgView.backgroundColor = UIColor.clearColor()
        btnEnter.layer.borderWidth = 2
        btnEnter.layer.borderColor = UIColor(hex: 0xF4E922).CGColor
        btnEnter.layer.cornerRadius = 0.11 * btnEnter.bounds.size.width
        btnEnter.layer.masksToBounds = true

    }

}
