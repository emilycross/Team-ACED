//
//  SpecificPlaylistViewController.swift
//  JognJam
//
//  Created by Team-ACED on 2016-11-17.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import UIKit

class SpecificPlaylistViewController: UIViewController {

    /* Maintain user and music player */
    var user = userProfile()
    var player = musicPlayer()
    
    @IBOutlet weak var profilePictureButton: UIButton!
    
    @IBOutlet weak var playlistNumberLabel: UILabel!
    
    @IBOutlet weak var song1: UIButton!
    @IBOutlet weak var song2: UIButton!
    @IBOutlet weak var song3: UIButton!
    @IBOutlet weak var song4: UIButton!
    @IBOutlet weak var song5: UIButton!
    
    /* Number for which playlist the user is viewing */
    var playlistNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Make status bar visible */
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        /* Update profile picture */
        profilePictureButton.setImage(user.picture, forState: UIControlState.Normal)
        
        /* Set label of number of playlist */
        playlistNumberLabel.text = "Playlist " + String(playlistNumber+1)
        
        retrievePlaylist()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /* Retrieve playlist and display it */
    func retrievePlaylist() {
        player.playSelectedPlaylist(playlistNumber)
        displayPlaylistSong(song1, num: 0)
        displayPlaylistSong(song2, num: 1)
        displayPlaylistSong(song3, num: 2)
        displayPlaylistSong(song4, num: 3)
        displayPlaylistSong(song5, num: 4)
    }
    
    /* Display playlist song title and artist if available on button */
    func displayPlaylistSong(button: UIButton, num: Int) {
        if playlistNumber == 0 {
            if player.playlist1Indices[num] == -1 {
                button.setTitle("No song available", forState: UIControlState.Normal)
                button.enabled = false
            }
            /* Get song titles and artists for playlist */
            else {
                button.setTitle((player.playlist1Titles[num]+" - "+player.playlist1Artists[num]), forState: UIControlState.Normal)
            }
        }
            
        else if playlistNumber == 1 {
            if player.playlist2Indices[num] == -1 {
                button.setTitle("No song available", forState: UIControlState.Normal)
                    button.enabled = false
            }
            else {
                button.setTitle((player.playlist2Titles[num]+" - "+player.playlist2Artists[num]), forState: UIControlState.Normal)
            }
        }
        
        else if playlistNumber == 2 {
            if player.playlist3Indices[num] == -1 {
                button.setTitle("No song available", forState: UIControlState.Normal)
                    button.enabled = false
            }
            else {
                button.setTitle((player.playlist3Titles[num]+" - "+player.playlist3Artists[num]), forState: UIControlState.Normal)
            }
        }
            
        else if playlistNumber == 3 {
            if player.playlist4Indices[num] == -1 {
                button.setTitle("No song available", forState: UIControlState.Normal)
                    button.enabled = false
            }
            else {
                button.setTitle((player.playlist4Titles[num]+" - "+player.playlist4Artists[num]), forState: UIControlState.Normal)
            }
        }
            
        else if playlistNumber == 4 {
            if player.playlist5Indices[num] == -1 {
                button.setTitle("No song available", forState: UIControlState.Normal)
                    button.enabled = false
            }
            
            else {
                button.setTitle((player.playlist5Titles[num]+" - "+player.playlist5Artists[num]), forState: UIControlState.Normal)
            }
        }

    }
    
    /* Segue preparation */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "songOneToMain" {
            let destinationVC = segue.destinationViewController as? MainViewController
            user.start = false
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.playlistSong = 0
            destinationVC?.playlistNumber = playlistNumber

        }
            
        else if segue.identifier == "songTwoToMain" {
            let destinationVC = segue.destinationViewController as? MainViewController
            user.start = false
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.playlistSong = 1
            destinationVC?.playlistNumber = playlistNumber

        }
            
        else if segue.identifier == "songThreeToMain" {
            let destinationVC = segue.destinationViewController as? MainViewController
            user.start = false
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.playlistSong = 2
            destinationVC?.playlistNumber = playlistNumber

        }
            
        else if segue.identifier == "songFourToMain" {
            let destinationVC = segue.destinationViewController as? MainViewController
            user.start = false
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.playlistSong = 3
            destinationVC?.playlistNumber = playlistNumber
            
        }
            
        else if segue.identifier == "songFiveToMain" {
            let destinationVC = segue.destinationViewController as? MainViewController
            user.start = false
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.playlistSong = 4
            destinationVC?.playlistNumber = playlistNumber

        }
            
        else if segue.identifier == "specificPlaylistToPlaylist" {
            let destinationVC = segue.destinationViewController as? PlaylistViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
        }
            
        else if segue.identifier == "specificPlaylistToProfile" {
            let destinationVC = segue.destinationViewController as? ProfileViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
        }
            
        else if segue.identifier == "specificPlaylistToLogin" {
            self.user.start = true
            self.player.pause()
        }
    }
}
