//
//  SuggestByViewController.swift
//  JognJam
//
//  Created by Team-ACED on 2016-11-15.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import UIKit

class SuggestByViewController: UIViewController {

    /* Maintain user and music player */
    var user = userProfile()
    var player = musicPlayer()
    
    @IBOutlet weak var profilePictureButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Make status bar visible */
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        /* Update profile picture */
        profilePictureButton.setImage(user.picture, forState: UIControlState.Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /* Segue preparation */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "suggestByToMain" {
            let destinationVC = segue.destinationViewController as? MainViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
        }
            
        else if segue.identifier == "suggestByToProfile" {
            let destinationVC = segue.destinationViewController as? ProfileViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
        }
            
        else if segue.identifier == "suggestByToSuggestionsArtist" {
            let destinationVC = segue.destinationViewController as? SuggestionsViewController
            destinationVC?.user = self.user
            destinationVC?.suggestBy = "artist"
            destinationVC?.player = self.player
        }
            
        else if segue.identifier == "suggestByToSuggestionsGenre" {
            let destinationVC = segue.destinationViewController as? SuggestionsViewController
            destinationVC?.user = self.user
            destinationVC?.suggestBy = "genre"
            destinationVC?.player = self.player
        }
            
        else if segue.identifier == "suggestByToSuggestionsSpeed" {
            let destinationVC = segue.destinationViewController as? SuggestionsViewController
            destinationVC?.user = self.user
            destinationVC?.suggestBy = "speed"
            destinationVC?.player = self.player
        }
            
        else if segue.identifier == "suggestByToSuggestionsLocation" {
            let destinationVC = segue.destinationViewController as? SuggestionsViewController
            destinationVC?.user = self.user
            destinationVC?.suggestBy = "location"
            destinationVC?.player = self.player
        }
            
        else if segue.identifier == "suggestByToLogin" {
            self.user.start = true
            self.player.pause()
        }
    }
}
