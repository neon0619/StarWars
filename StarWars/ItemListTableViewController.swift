//
//  File.swift
//  StarWars
//
//  Created by --=_t0tep_=-- on 28/02/2016.
//  Copyright © 2016 --=_t0tep_=--. All rights reserved.
//

import UIKit

class ItemListTableViewController: UIViewController, UITableViewDelegate {
    
    let apiFunction = APIFunction()
    let apiURL = APIurls()
    let toast = ToastFunction()
    let alert = AlertDialogs()
    
    @IBOutlet weak var tblView: UITableView!
    
    var titleType = ""
    var typeSelected = ""
    var arrayItemsObject = [NSDictionary]()
    var selectedObject = NSDictionary()

    
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.topItem?.title = titleType
        toast.showBlackActivity(self)
        getItem()
    }
    
    
    func getItem() {
        
        if ConnectionDetector.isConnectedToNetwork() {
            
            apiFunction.getTypeInfo(apiURL.baseURL, type: typeSelected) { (arrayItems) -> () in
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.arrayItemsObject = arrayItems
                    
                    if self.arrayItemsObject.count != 0 {
                        print("WITH DATA")
                    }else{
                        self.alert.showLazyAlertController("StarWars", msg: "Server Error. Please try again.", viewController: self)
                    }
                    
                    self.tblView.reloadData()
                    self.toast.hideActivity(self)
                    
                    for item in self.arrayItemsObject {
                        print(item["name"]!)
                    }
                })
            }

            
        }else {
            
            alert.showLazyAlertController("StarWars", msg: "No Internet Connection", viewController: self)
            
        }
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayItemsObject.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: TypeListCell = tableView.dequeueReusableCellWithIdentifier("typeListCell") as! TypeListCell
        
        cell.imgtType.image = UIImage(named: (self.arrayItemsObject[indexPath.row]["name"]! as? String)!)
        cell.imgtType.layer.cornerRadius = CGRectGetWidth(cell.imgtType.frame)/2.11
        cell.imgtType.layer.masksToBounds = true
        cell.lblType.text = self.arrayItemsObject[indexPath.row]["name"]! as? String
        
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(hex: 0x2E3C50).colorWithAlphaComponent(0.5)
        cell.selectedBackgroundView = backgroundView
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        selectedObject = arrayItemsObject[indexPath.row]
        performSegueWithIdentifier("toItemDetails", sender: self)
    }

    
    @IBAction func menu(sender: AnyObject) {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toItemDetails" {
            
            let navigationController = segue.destinationViewController as! UINavigationController
            let itemDetails = navigationController.topViewController as! ItemDetailsViewController
            itemDetails.typeSelected = typeSelected
            itemDetails.objectSelected = selectedObject
            
        }
        
    }
    
}
