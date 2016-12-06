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
    @IBOutlet weak var playlist1Button: UIButton!
    @IBOutlet weak var playlist2Button: UIButton!
    @IBOutlet weak var playlist3Button: UIButton!
    @IBOutlet weak var playlist4Button: UIButton!
    @IBOutlet weak var playlist5Button: UIButton!
    
    @IBOutlet weak var createNewPlaylistButton: UIButton!
    
    
    var numPlaylists = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /* Make status bar visible */
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        /* Set profile picture image */
        profilePictureButton.setImage(user.picture, forState: UIControlState.Normal)
        
        /* Check how many playlists there are */
        for i in 0...4 {
            if (user.playlists[i] == true) {
                numPlaylists += 1
            }
        }
        
        /* Only allow the user to have 5 playlists */
        if (numPlaylists == 5) {
            createNewPlaylistButton.hidden = true
        }
            
        /* Display buttons for each playlist that currently exists */
        else if (numPlaylists < 5){
            playlist5Button.hidden = true
            if numPlaylists < 4 {
                playlist4Button.hidden = true
                if numPlaylists < 3 {
                    playlist3Button.hidden = true
                    if numPlaylists < 2 {
                        playlist2Button.hidden = true
                    }
                }
            }
    
        }
        
        else {
            playlist1Button.hidden = true
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    /* Segue preparation */
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
            destinationVC?.playlistNumber = 0
        }
            
        else if segue.identifier == "playlistTwoToDetails" {
            let destinationVC = segue.destinationViewController as? SpecificPlaylistViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.playlistNumber = 1
        }
            
        else if segue.identifier == "playlistThreeToDetails" {
            let destinationVC = segue.destinationViewController as? SpecificPlaylistViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.playlistNumber = 2
        }
            
        else if segue.identifier == "playlistFourToDetails" {
            let destinationVC = segue.destinationViewController as? SpecificPlaylistViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.playlistNumber = 3
        }
            
        else if segue.identifier == "playlistFiveToDetails" {
            let destinationVC = segue.destinationViewController as? SpecificPlaylistViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.playlistNumber = 4
        }
            
        else if segue.identifier == "playlistToCreatePlaylist" {
            let destinationVC = segue.destinationViewController as? CreatePlaylistViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
        }
            
        else if segue.identifier == "playlistToMostPlayedSongs" {
            let destinationVC = segue.destinationViewController as? MostPlayedSongsViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
        }
            
        else if segue.identifier == "playlistToLogin" {
            self.user.start = true
            self.player.pause()
        }
    }
}
