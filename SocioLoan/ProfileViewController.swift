//
//  SecondViewController.swift
//  SocioLoan
//
//  Created by Ben Ormos on 25/06/2016.
//  Copyright © 2016 uk.co.benormos.firstapp. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var projectsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        projectsTable.delegate = self
        projectsTable.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // TODO: return number of projects
        
        return 4
    }
    
    func convertStringToDictionary(text: String) -> [String:AnyObject]? {
        if let data = text.dataUsingEncoding(NSUTF8StringEncoding) {
            do {
                return try NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String:AnyObject]
            } catch let error as NSError {
                print(error)
            }
        }
        return nil
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = projectsTable.dequeueReusableCellWithIdentifier("ProjectID") as! ProfileProjectsTableViewCell
        
        
        /*if let url = NSURL(string: "https://duckduckgo.com/i.js?q=Temple%20of%20the%20Golden%20Pavilion&s=1") {
            
            let session = NSURLSession.sharedSession()
            let dataTask = session.dataTaskWithURL(url,completionHandler: {(data,_,_) in
                defer {
                }
                if let data = data, string = String(data: data, encoding: NSUTF8StringEncoding) {
                    let json = self.convertStringToDictionary(string)!
                    let img_url_string = String(json["results"]![0]["image"])
                    var URLString = img_url_string[img_url_string.startIndex.advancedBy(9)...img_url_string.endIndex.advancedBy(-2)]
                    
                    print(URLString)
            
                    let img_url = NSURL(string: URLString)
                    
                    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
                        let data = NSData(contentsOfURL: img_url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
                        dispatch_async(dispatch_get_main_queue(), {
                            cell.profileProjectImageView.image = UIImage(data: data!)
                        });
                    }
                }
                }
            )
            
            dataTask.resume()
        }*/
        
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func logoutFromFacebook(sender: UIButton) {
        
        let loginManager = FBSDKLoginManager()
        loginManager.logOut()
        
        self.navigationController?.popViewControllerAnimated(true)
        
        //UIViewController *prevVC = [self.navigationController.viewControllers objectAtIndex:<n>];
        //[self.navigationController popToViewController:prevVC animated:YES];
    }

}

