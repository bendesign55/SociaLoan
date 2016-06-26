//
//  SecondViewController.swift
//  SocioLoan
//
//  Created by Ben Ormos on 25/06/2016.
//  Copyright © 2016 uk.co.benormos.firstapp. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Alamofire
import AlamofireImage

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var cardNumberLabel: UILabel!
    
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
        
        return 1
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
                
        if let URLString = NSURL(string: "https://duckduckgo.com/i.js") {
            
            Alamofire.request(
                .GET,
                URLString,
                parameters: ["q": "China"],
                encoding: .URL)
                .validate()
                .responseJSON { response in
                    if response.result.isSuccess {
                        if let value = response.result.value as? [String: AnyObject] {
                            let results = value["results"] as? [[String: AnyObject]]
                            let partialResultDict = results![0]
                            let imgString = partialResultDict["thumbnail"]!
                            let img_url = imgString as! String
                            Alamofire.request(.GET, img_url)
                                .responseImage { response in
                                    debugPrint(response)
                                    
                                    print(response.request)
                                    print(response.response)
                                    debugPrint(response.result)
                                    
                                    if let image = response.result.value {
                                        print("image downloaded: \(image)")
                                        print(image.dynamicType)
                                        cell.profileProjectImageView.image = image
                                        
                                    }
                            }
                        }
                    }
            }
            
            
        }
        
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

