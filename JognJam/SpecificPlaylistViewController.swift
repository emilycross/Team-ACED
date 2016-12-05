//
//  SpecificPlaylistViewController.swift
//  JognJam
//
//  Created by Team-ACED on 2016-11-17.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import UIKit

class SpecificPlaylistViewController: UIViewController {

    var user = userProfile()
    var player = musicPlayer()
    
    @IBOutlet weak var profilePictureButton: UIButton!
    
    var playlistNumber = 0
    
    @IBOutlet weak var playlistNumberLabel: UILabel!
    
    @IBOutlet weak var song1: UIButton!
    @IBOutlet weak var song2: UIButton!
    @IBOutlet weak var song3: UIButton!
    @IBOutlet weak var song4: UIButton!
    @IBOutlet weak var song5: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Makes the status bar visible
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        profilePictureButton.setImage(user.picture, forState: UIControlState.Normal)
        
        playlistNumberLabel.text = "Playlist " + String(playlistNumber)
        
        retrievePlaylist()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func retrievePlaylist() {
        player.playSelectedPlaylist(playlistNumber)
        displayPlaylistSong(song1, num: 0)
        displayPlaylistSong(song2, num: 1)
        displayPlaylistSong(song3, num: 2)
        displayPlaylistSong(song4, num: 3)
        displayPlaylistSong(song5, num: 4)
    }
    
    func displayPlaylistSong(button: UIButton, num: Int)
    {
        if player.playlistIndices[num] == -1 {
            button.setTitle("No song available", forState: UIControlState.Normal)
            button.enabled = false
        }
        else {
            button.setTitle((player.playlistArtists[num]+" - "+player.playlistArtists[num]), forState: UIControlState.Normal)
        }
    }
    
    
    /* segue preparation */
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
