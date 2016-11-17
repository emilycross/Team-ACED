//
//  MainViewController.swift
//  JognJam
//
//  Created by Team-ACED on 2016-11-09.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var currentSongLabel: UILabel!
    
    var player = musicPlayer()
    var start = true
    
    var user = userProfile()
    
    @IBOutlet weak var currentSpeedLabel: UILabel!
    var currentSpeed = 0 //Get data from accelerometer
    
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var suggestionsLabel: UILabel!
    
    @IBOutlet weak var suggestedSongButton: UIButton!
    var suggestSongTitle = ""
    var suggestedArtist = ""
    
    @IBOutlet weak var profilePictureButton: UIButton!
    //boolean to show that music is playing and the play button is the pause image
    
    var isPlayingMusic = false
    @IBOutlet weak var playButton: UIButton!
    let playImage = UIImage(named: "playButton.png")
    let pauseImage = UIImage(named: "pauseButton.png")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currentSongLabel.text = player.currentSongTitle + " - " + player.currentArtist
        user.currentSongTitle = player.currentSongTitle
        user.currentSongArtist = player.currentArtist
        user.currentSongIndex = player.currentIndex
        currentSpeedLabel.text = String(currentSpeed) + " km/h"
        suggestedSongButton.setTitle((suggestSongTitle + " - " + suggestedArtist), forState: UIControlState.Normal)
        if user.musicSuggestions == false {
            suggestedSongButton.hidden = true
            suggestionsLabel.hidden = true
            moreButton.hidden = true
        }
        else {
            suggestedSongButton.hidden = false
            suggestionsLabel.hidden = false
            moreButton.hidden = false
        }
        profilePictureButton.setImage(user.picture, forState: UIControlState.Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func playButtonPressed(sender: UIButton) {
        if start == true {
            player.pickSong(0)
        }
        start = false
        currentSongLabel.text = player.currentSongTitle + " - " + player.currentArtist
        user.currentSongTitle = player.currentSongTitle
        user.currentSongArtist = player.currentArtist
        user.currentSongGenre = player.currentGenre
        user.currentSongIndex = player.currentIndex
        //changes song to current song
        //changes the image
        isPlayingMusic = !isPlayingMusic
        if isPlayingMusic == true {
            playButton.setImage(pauseImage, forState: UIControlState.Normal)
            player.play()
        }
        else {
            playButton.setImage(playImage, forState: UIControlState.Normal)
            player.pause()
        }
        player.getSuggestionsByArtist(user.currentSongArtist)
        suggestedSongButton.setTitle(player.suggestionsTitles[0] + " - " + player.suggestionsArtists[0], forState: UIControlState.Normal)
    }
    
    @IBAction func prevButtonPressed(sender: UIButton) {
        player.pickSong(0) //or pick a different song
        start = false
        playButton.setImage(pauseImage, forState: UIControlState.Normal)
        player.play()
        currentSongLabel.text = player.currentSongTitle + " - " + player.currentArtist
        user.currentSongTitle = player.currentSongTitle
        user.currentSongArtist = player.currentArtist
        user.currentSongGenre = player.currentGenre
        user.currentSongIndex = player.currentIndex
    }
    
    @IBAction func nextButtonPressed(sender: UIButton) {
        player.pickSong(0) //or pick a different song
        start = false
        playButton.setImage(pauseImage, forState: UIControlState.Normal)
        player.play()
        currentSongLabel.text = player.currentSongTitle + " - " + player.currentArtist
        user.currentSongTitle = player.currentSongTitle
        user.currentSongArtist = player.currentArtist
        user.currentSongGenre = player.currentGenre
        user.currentSongIndex = player.currentIndex
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
        if segue.identifier == "mainToSettings" {
            let destinationVC = segue.destinationViewController as? SettingsViewController
            destinationVC?.user = self.user
        }
        else if segue.identifier == "mainToProfile" {
            let destinationVC = segue.destinationViewController as? ProfileViewController
            destinationVC?.user = self.user
        }
        else if segue.identifier == "mainToSuggestBy" {
            let destinationVC = segue.destinationViewController as? SuggestByViewController
            destinationVC?.user = self.user
        }
    }
}
