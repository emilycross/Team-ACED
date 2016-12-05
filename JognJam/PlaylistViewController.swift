//
//  PlaylistViewController.swift
//  JognJam
//
//  Created by Team-ACED on 2016-11-17.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import UIKit

class PlaylistViewController: UIViewController {

    var user = userProfile()
    var player = musicPlayer()
    
    @IBOutlet weak var profilePictureButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Makes the status bar visible
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        profilePictureButton.setImage(user.picture, forState: UIControlState.Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    /* segue preparation */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "playlistToProfile" {
            let destinationVC = segue.destinationViewController as? ProfileViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
        }
        
        else if segue.identifier == "playlistOneToDetails" {
            let destinationVC = segue.destinationViewController as? SpecificPlaylistViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.playlistNumber = 1
        }
            
        else if segue.identifier == "playlistTwoToDetails" {
            let destinationVC = segue.destinationViewController as? SpecificPlaylistViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.playlistNumber = 2
        }
            
        else if segue.identifier == "playlistThreeToDetails" {
            let destinationVC = segue.destinationViewController as? SpecificPlaylistViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.playlistNumber = 3
        }
            
        else if segue.identifier == "playlistFourToDetails" {
            let destinationVC = segue.destinationViewController as? SpecificPlaylistViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.playlistNumber = 4
        }
            
        else if segue.identifier == "playlistFiveToDetails" {
            let destinationVC = segue.destinationViewController as? SpecificPlaylistViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.playlistNumber = 5
        }
        else if segue.identifier == "playlistToLogin" {
            self.user.start = true
            self.player.pause()
        }
    }
}
