//
//  LoginViewController.swift
//  JognJam
//
//  Created by Emily Cross on 2016-11-09.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    var counter = 0;
    var timeInterval = NSTimer()
    
    //For checking if login is correct
    
    var database = UsersDatabase()
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var logo: UIButton!
    let image1 = UIImage(named: "Logo1_Circle.png")
    let image2 = UIImage(named: "Logo2_Cirle.png")
    
    
    func incrementTimer() {
        if (counter%2 == 0) {
            logo.setImage(image1, forState: UIControlState.Normal)
        }
        
        else {
            logo.setImage(image2, forState: UIControlState.Normal)
            
        }
        counter += 1
    }
    
    /* func roundButton () {
        logo.layer.cornerRadius = logo.frame.size.width/2
        logo.clipsToBounds = true
        
        
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeInterval = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(incrementTimer), userInfo: nil, repeats: true)

        
        // Do any additional setup after loading the view.*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //For checking if login is correct
    //Error: typing keyboard covers buttons so need to figure out how to change
    /*@IBAction func loginPressed(sender: UIButton) {
        if database.checkIfRight(usernameTextField.text!, password: passwordTextField.text!) {
            performSegueWithIdentifier("loginToMain", sender: self)
        }
    }*/
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
