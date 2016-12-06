//
//  LoginViewController.swift
//  JognJam
//
//  Created by Team-ACED on 2016-11-09.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    /* user profile & music player */
    var user = userProfile()
    var player = musicPlayer()
    var username = ""
        
    
    /* database for users */
    var database = UsersDatabase()
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    /* show if user enters invalid login credentials */
    @IBOutlet weak var invalidLogin: UILabel!
    
    @IBOutlet weak var logo: UIButton!
    /* images for animated logo */
    let image1 = UIImage(named: "Logo1_Circle.png")
    let image2 = UIImage(named: "Logo2_Circle.png")
    
    /* counter and timer */
    var counter = 0;
    var timeInterval = NSTimer()

    
    /* use timer to change between the two logo images */
    func incrementTimer() {
        if (counter%2 == 0) {
            logo.setImage(image1, forState: UIControlState.Normal)
        }
        
        else {
            logo.setImage(image2, forState: UIControlState.Normal)
            
        }
        counter += 1
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent

        /* set timer */
        timeInterval = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(incrementTimer), userInfo: nil, repeats: true)
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /* check login credentials */
    @IBAction func loginPressed(sender: UIButton) {
        if (database.checkIfRight(usernameTextField.text!, password: passwordTextField.text!)) {
            username = usernameTextField.text!
            performSegueWithIdentifier("loginToMain", sender: self)

        }
        
        else {
            invalidLogin.hidden = false
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "loginToMain" {
            let destinationVC = segue.destinationViewController as? MainViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.user.username = self.username
        }
    }
    
    
}