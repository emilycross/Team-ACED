//
//  ProfileViewController.swift
//  JognJam
//
//  Created by Team-ACED on 2016-11-09.
//  Copyright © 2016 Team ACED. All rights reserved.
//


import UIKit
import CoreMotion

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var profilePictureButton: UIButton!
    @IBOutlet weak var numberStepsLabel: UILabel!
    
    var user = userProfile()
    var player = musicPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Makes the status bar visible
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        usernameLabel.text = user.username
        profilePictureButton.setImage(user.picture, forState: UIControlState.Normal)
        numberStepsLabel.text = String(user.numberSteps)+" steps"
        
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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "profileToProfilePicture" {
            let destinationVC = segue.destinationViewController as? ProfilePictureViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
        }
        else if segue.identifier == "profileToMain" {
            let destinationVC = segue.destinationViewController as? MainViewController
            //user start = false
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
            self.player.pause()
        }
        
    }
    
}
