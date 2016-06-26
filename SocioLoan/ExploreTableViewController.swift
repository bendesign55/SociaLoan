//
//  ExploreViewController.swift
//  SocioLoan
//
//  Created by Ben Ormos on 25/06/2016.
//  Copyright © 2016 uk.co.benormos.firstapp. All rights reserved.
//

import UIKit
import FBSDKCoreKit


class ExploreTableViewController: UITableViewController {
    
    struct exploreCell {
        let nameOfPerson: String
        let nameOfProject: String
        let image: UIImage
        let amount: String
    }
    
    let cells = [exploreCell(nameOfPerson: "P", nameOfProject: "Making a porn video", image: UIImage(named: "dickbut")!, amount: "$5000"),
                 exploreCell(nameOfPerson: "I", nameOfProject: "Making a lots of porn videos", image: UIImage(named: "dickbut")!, amount: "$6900"),
                 exploreCell(nameOfPerson: "N", nameOfProject: "Making the best porn video", image: UIImage(named: "dickbut")!, amount: "$69000"),
                 exploreCell(nameOfPerson: "Á", nameOfProject: "Making a porn video website", image: UIImage(named: "dickbut")!, amount: "$690000"),
                 exploreCell(nameOfPerson: "K", nameOfProject: "Simple prostitution", image: UIImage(named: "dickbut")!, amount: "$69")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let parameters = ["fields": "name,picture.type(normal)", "limit": "5"]
        FBSDKGraphRequest(graphPath: "me/taggable_friends", parameters: parameters).startWithCompletionHandler({ (connection, user, requestError) -> Void in
            if requestError != nil {
                print(requestError)
                return
            }
            
            print(user)
        })
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ExploreRowID", forIndexPath: indexPath) as! ExploreTableViewCell
        cell.nameOfPerson.text = cells[indexPath.row].nameOfPerson
        cell.nameOfProject.text = cells[indexPath.row].nameOfProject
        cell.profileImage.image = cells[indexPath.row].image
        cell.amount.text = cells[indexPath.row].amount
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
