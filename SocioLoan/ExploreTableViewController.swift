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

    
    // For more complex open graph stories, use `FBSDKShareAPI`
    // with `FBSDKShareOpenGraphContent`
    /* make the API call */
//    var request = FBSDKGraphRequest()
//    initWithGraphPath:@"/{friend-list-id}"
//    parameters:params
//    HTTPMethod:@"GET"];
//    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
//    id result,
//    NSError *error) {
//    // Handle the result
//    }];
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ExploreRowID", forIndexPath: indexPath) as! ExploreTableViewCell
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        let s = FBSDKGraphRequest(graphPath: "me/friends", parameters: ["fields": "data"], HTTPMethod: "GET")
        
        _ = FBSDKGraphRequestConnection()
        
        s.startWithCompletionHandler({ connection, result, error in
            if error != nil {
                print(error)
                return
            }
            
            print(result)
        })
        // Do any additional setup after loading the view.
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
