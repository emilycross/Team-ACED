//
//  ProfileViewController.swift
//  JognJam
//
//  Created by Team-ACED on 2016-11-09.
//  Copyright © 2016 Team ACED. All rights reserved.
//


import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profilePictureButton: UIButton!

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var numberStepsLabel: UILabel!
    
    /* Maintain user and music player */
    var user = userProfile()
    var player = musicPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Make status bar visible */
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        /* Display username */
        usernameLabel.text = user.username
        
        /* Set profile picture image */
        profilePictureButton.setImage(user.picture, forState: UIControlState.Normal)
        user.numberSteps = (UIApplication.sharedApplication().delegate! as! AppDelegate).nSteps
        
        /* Print number of steps from pedometer */
        numberStepsLabel.text = String(user.numberSteps) + " steps"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /* Segue preparation */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "profileToProfilePicture" {
            let destinationVC = segue.destinationViewController as? ProfilePictureViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
        }
            
        else if segue.identifier == "profileToMain" {
            let destinationVC = segue.destinationViewController as? MainViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
        }
        
        else if segue.identifier == "profileToPlaylists" {
            let destinationVC = segue.destinationViewController as? PlaylistViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
        }
        
        else if segue.identifier == "profileToRoutes" {
            let destinationVC = segue.destinationViewController as? RouteViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
        }
            
        else if segue.identifier == "profileToLogin" {
            self.user.start = true
            self.player.pause()
        }
    }
    
}
