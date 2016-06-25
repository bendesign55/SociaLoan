//
//  SecondViewController.swift
//  SocioLoan
//
//  Created by Ben Ormos on 25/06/2016.
//  Copyright © 2016 uk.co.benormos.firstapp. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func logoutFromFacebook(sender: UIButton) {
        
        var loginManager = FBSDKLoginManager()
        loginManager.logOut()
        
        self.navigationController?.popViewControllerAnimated(true)
        
        //UIViewController *prevVC = [self.navigationController.viewControllers objectAtIndex:<n>];
        //[self.navigationController popToViewController:prevVC animated:YES];
    }

}

