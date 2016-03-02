//
//  ItemDetailsViewController.swift
//  StarWars
//
//  Created by --=_t0tep_=-- on 28/02/2016.
//  Copyright © 2016 --=_t0tep_=--. All rights reserved.
//

import UIKit

class ItemDetailsViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var imgLogo: UIImageView!
    
    @IBOutlet weak var viewController: UIView!
    
    var arrayOfStarShipKey = ["name", "model", "manufacturer", "length", "starship_class", "passengers", "consumables", "starship_class"]
    var arrayOfPeopleKey = ["name", "height", "mass", "hair_color", "skin_color", "eye_color", "birth_year", "gender"]
    var arrayOfPlanetsKey = ["name", "rotation_period", "orbital_period", "diameter", "climate", "gravity", "terrain", "population"]
    var arrayOfSpeciesKey = ["name", "classification", "designation", "average_height", "skin_colors", "hair_colors", "average_lifespan", "language"]
    
    
    let starShipKeyLabel = ["Name", "Model", "Manufacturer", "Length", "Starship Class", "Passengers", "Consumables", "Starship Class"]
    
    let peopleKeyLabel = ["Name", "Height", "Mass", "Hair color", "Skin color", "Eye color", "Birth year", "Gender"]
    
    let planetKeyLabel = ["Name", "Rotation period", "Orbital period", "Diameter", "Climate", "Gravity", "Terrain", "Population"]
    
    let speciesKeyLabel = ["Name", "Classification", "Designation", "Average height", "Skin colors", "Hair colors", "Average Lifespan", "Language"]
    
    
    var arrayOfStarShipKValue = Array<String>()
    var arrayOfPeopleValue = Array<String>()
    var arrayOfPlanetsValue = Array<String>()
    var arrayOfSpeciesValue = Array<String>()
    
    
    var arrayOfValue = Array<AnyObject>()
    
    var typeSelected = ""
    var objectSelected = NSDictionary()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bar: UINavigationBar! =  self.navigationController?.navigationBar

        bar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        bar.shadowImage = UIImage()
        bar.translucent = true
        
        
        viewController.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)
        let blurEffect = UIBlurEffect(style: .Dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = viewController.frame
        viewController.addSubview(blurView)
      
        imgLogo.image = UIImage(named: (objectSelected["name"] as? String)!)
        imgLogo.layer.cornerRadius = CGRectGetWidth(imgLogo.frame)/2.11
        imgLogo.layer.masksToBounds = true


        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell: DetailsListCell = tableView.dequeueReusableCellWithIdentifier("detailsListCell") as! DetailsListCell
        
        if typeSelected == "starships" {
            cell.lblKeyName.text = self.starShipKeyLabel[indexPath.row]
            cell.lblValueName.text = objectSelected[arrayOfStarShipKey[indexPath.row]] as? String
        
        }else if typeSelected == "people" {
            cell.lblKeyName.text = self.peopleKeyLabel[indexPath.row]
            cell.lblValueName.text = objectSelected[arrayOfPeopleKey[indexPath.row]] as? String
            
        }else if typeSelected == "planets" {
            cell.lblKeyName.text = self.planetKeyLabel[indexPath.row]
            cell.lblValueName.text = objectSelected[arrayOfPlanetsKey[indexPath.row]] as? String
            
        }else if typeSelected == "species" {
            cell.lblKeyName.text = self.speciesKeyLabel[indexPath.row]
            cell.lblValueName.text = objectSelected[arrayOfSpeciesKey[indexPath.row]] as? String
        }else {
            print("something went wrong")
        }
        
        return cell
        
    }
    
    
    
    
    @IBAction func back(sender: AnyObject) {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
    

}
