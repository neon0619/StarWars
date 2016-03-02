//
//  MenuViewController.swift
//  StarWars
//
//  Created by --=_t0tep_=-- on 01/03/2016.
//  Copyright © 2016 --=_t0tep_=--. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var starShipView: UIView!
    @IBOutlet weak var planetsView: UIView!
    @IBOutlet weak var peopleView: UIView!
    @IBOutlet weak var speciesView: UIView!
    
    
    @IBOutlet weak var btnShip: UIButton!
    @IBOutlet weak var btnPeople: UIButton!
    @IBOutlet weak var btnSpecies: UIButton!
    @IBOutlet weak var btnPlanet: UIButton!
    
    var titleType = ""
    var typeSelected = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        starShipView.backgroundColor = UIColor(hex: 0x030000).colorWithAlphaComponent(0.7)
        planetsView.backgroundColor = UIColor(hex: 0x030000).colorWithAlphaComponent(0.7)
        peopleView.backgroundColor = UIColor(hex: 0x030000).colorWithAlphaComponent(0.7)
        speciesView.backgroundColor = UIColor(hex: 0x030000).colorWithAlphaComponent(0.7)
        

    }
    
    
    @IBAction func btnActionShip(sender: AnyObject) {
        starShipView.backgroundColor = UIColor(hex: 0x030000).colorWithAlphaComponent(0.7)
        titleType = "StarShips"
        typeSelected = "starships"
        performSegueWithIdentifier("toTypeList", sender: self)
    }
    @IBAction func btnShipReleased(sender: AnyObject) {
        starShipView.backgroundColor = UIColor(hex: 0x030000).colorWithAlphaComponent(0.1)
    }
    
    
    
    
    @IBAction func btnActionPeople(sender: AnyObject) {
        peopleView.backgroundColor = UIColor(hex: 0x030000).colorWithAlphaComponent(0.7)
        titleType = "People"
        typeSelected = "people"
        performSegueWithIdentifier("toTypeList", sender: self)
    }
    @IBAction func btnPeopleReleased(sender: AnyObject) {
        peopleView.backgroundColor = UIColor(hex: 0x030000).colorWithAlphaComponent(0.1)
    }
    
    
    
    
    @IBAction func btnActionSpecies(sender: AnyObject) {
        speciesView.backgroundColor = UIColor(hex: 0x030000).colorWithAlphaComponent(0.7)
        titleType = "Species"
        typeSelected = "species"
        performSegueWithIdentifier("toTypeList", sender: self)
    }
    @IBAction func btnSpecies(sender: AnyObject) {
        speciesView.backgroundColor = UIColor(hex: 0x030000).colorWithAlphaComponent(0.1)
    }
    
    
    
    @IBAction func btnActionPlanets(sender: AnyObject) {
        planetsView.backgroundColor = UIColor(hex: 0x030000).colorWithAlphaComponent(0.7)
        titleType = "Planets"
        typeSelected = "planets"
        performSegueWithIdentifier("toTypeList", sender: self)
    }
    
    @IBAction func btnPlanetsReleases(sender: AnyObject) {
        planetsView.backgroundColor = UIColor(hex: 0x030000).colorWithAlphaComponent(0.1)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toTypeList" {
            
            let navigationController = segue.destinationViewController as! UINavigationController
            let itemTypeListVC = navigationController.topViewController as! ItemListTableViewController
            itemTypeListVC.titleType = titleType
            itemTypeListVC.typeSelected = typeSelected
            
        }
    }
    

    
    
}
