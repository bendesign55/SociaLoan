//
//  LoginViewController.swift
//  SocioLoan
//
//  Created by Ben Ormos on 25/06/2016.
//  Copyright © 2016 uk.co.benormos.firstapp. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController {

    override func viewDidAppear(animated: Bool) {
        if (FBSDKAccessToken.currentAccessToken() != nil) {
            self.performSegueWithIdentifier("loginID", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var loginButton = FBSDKLoginButton()
        
        loginButton.center = self.view.center
        self.view.addSubview(loginButton)
        
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
