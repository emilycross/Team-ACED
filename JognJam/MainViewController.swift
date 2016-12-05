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
    
    var fromSuggestions = -1
    
    var playlistNumber = -1
    var playlistSong = -1
    
    var user = userProfile()
    var player = musicPlayer()
    
    @IBOutlet weak var currentSpeedLabel: UILabel!
    var currentSpeedOfSong = 0
    
    
    
    @IBOutlet weak var suggestionsLabel: UILabel!
    @IBOutlet weak var suggestedSongButton: UIButton!
    @IBOutlet weak var moreButton: UIButton!
    
    
    var suggestedSongTitle = ""
    var suggestedArtist = ""
    
    @IBOutlet weak var profilePictureButton: UIButton!
    //boolean to show that music is playing and the play button is the pause image
    var isPlayingMusic = false
    
    @IBOutlet weak var playButton: UIButton!
    let playImage = UIImage(named: "playButton.png")
    let pauseImage = UIImage(named: "pauseButton.png")
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Makes the status bar visible
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        
        if user.start == true {
            currentSongLabel.text = "No song playing"
            suggestedSongButton.setTitle("No suggestions", forState: UIControlState.Normal)
            suggestedSongButton.enabled = false
            moreButton.enabled = false
            moreButton.hidden = true
            prevButton.hidden = true
            prevButton.enabled = false
            nextButton.hidden = true
            nextButton.enabled = false
        }
        else if fromSuggestions == -1 && (playlistNumber == -1 || playlistSong == -1){
            currentSongLabel.text = player.currentSongTitle + " - " + player.currentArtist
            prevButton.hidden = false
            prevButton.enabled = true
            nextButton.hidden = false
            nextButton.enabled = true
        }
        else if playlistNumber != -1 && playlistSong != -1 {
            playPlaylist(playlistSong)
            prevButton.hidden = false
            prevButton.enabled = true
            nextButton.hidden = false
            nextButton.enabled = true
        }
        else { //fromSuggestions != -1
            playSuggestions(fromSuggestions)
            prevButton.hidden = false
            prevButton.enabled = true
            nextButton.hidden = false
            nextButton.enabled = true
        }
        
        user.currentSongTitle = player.currentSongTitle
        user.currentSongArtist = player.currentArtist
        user.currentSongIndex = player.currentIndex
        user.currentSongSpeed = player.currentSongSpeed
        user.currentLocation = player.currentLocation
        currentSpeedLabel.text = String(player.currentSongSpeed) + " bpm"
        
        if user.musicSuggestions == false {
            suggestedSongButton.hidden = true
            suggestionsLabel.hidden = true
            moreButton.hidden = true
        }
        else {
            suggestedSongButton.hidden = false
            suggestionsLabel.hidden = false
            if user.start == false {
                moreButton.hidden = false
            }
            setSuggestionLabel()
        }
        if player.songPlaying == true {
            playButton.setImage(pauseImage, forState: UIControlState.Normal)
            currentSongLabel.text = player.currentSongTitle + " - " + player.currentArtist
            currentSpeedLabel.text = String(user.currentSongSpeed) + " bpm"
            isPlayingMusic = true
            if user.musicSuggestions == true {
                setSuggestionLabel()
            }
        }
        
        profilePictureButton.setImage(user.picture, forState: UIControlState.Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func playButtonPressed(sender: UIButton) {
        if user.start == true { //pick a random song to play
            player.randomPick()
        }
        user.start = false
        currentSongLabel.text = player.currentSongTitle + " - " + player.currentArtist
        user.currentSongTitle = player.currentSongTitle
        user.currentSongArtist = player.currentArtist
        user.currentSongGenre = player.currentGenre
        user.currentSongIndex = player.currentIndex
        user.currentSongSpeed = player.currentSongSpeed
        user.currentLocation = player.currentLocation
        currentSpeedLabel.text = String(user.currentSongSpeed) + " bpm"
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
        if user.musicSuggestions == true {
            setSuggestionLabel()
        }
        prevButton.hidden = false
        prevButton.enabled = true
        nextButton.hidden = false
        nextButton.enabled = true
    }
    
    @IBAction func prevButtonPressed(sender: UIButton) {
        user.start = false
        playButton.setImage(pauseImage, forState: UIControlState.Normal)
        player.prev()
        player.play()
        currentSongLabel.text = player.currentSongTitle + " - " + player.currentArtist
        user.currentSongTitle = player.currentSongTitle
        user.currentSongArtist = player.currentArtist
        user.currentSongGenre = player.currentGenre
        user.currentSongIndex = player.currentIndex
        user.currentSongSpeed = player.currentSongSpeed
        user.currentLocation = player.currentLocation
        currentSpeedLabel.text = String(user.currentSongSpeed) + " bpm"
        isPlayingMusic = true
        if user.musicSuggestions == true {
            setSuggestionLabel()
        }
        prevButton.hidden = false
        prevButton.enabled = true
        nextButton.hidden = false
        nextButton.enabled = true

    }
    
    @IBAction func nextButtonPressed(sender: UIButton) {
        user.start = false
        playButton.setImage(pauseImage, forState: UIControlState.Normal)
        player.next()
        player.play()
        currentSongLabel.text = player.currentSongTitle + " - " + player.currentArtist
        user.currentSongTitle = player.currentSongTitle
        user.currentSongArtist = player.currentArtist
        user.currentSongGenre = player.currentGenre
        user.currentSongIndex = player.currentIndex
        user.currentSongSpeed = player.currentSongSpeed
        user.currentLocation = player.currentLocation
        currentSpeedLabel.text = String(user.currentSongSpeed) + " bpm"
        isPlayingMusic = true
        if user.musicSuggestions == true {
            setSuggestionLabel()
        }
        prevButton.hidden = false
        prevButton.enabled = true
        nextButton.hidden = false
        nextButton.enabled = true
    }
    

    @IBAction func suggestionSongPressed(sender: UIButton) {
        user.start = false
        playButton.setImage(pauseImage, forState: UIControlState.Normal)
        player.suggestionPressed()
        player.play()
        currentSongLabel.text = player.currentSongTitle + " - " + player.currentArtist
        user.currentSongTitle = player.currentSongTitle
        user.currentSongArtist = player.currentArtist
        user.currentSongGenre = player.currentGenre
        user.currentSongIndex = player.currentIndex
        user.currentSongSpeed = player.currentSongSpeed
        user.currentLocation = player.currentLocation
        currentSpeedLabel.text = String(user.currentSongSpeed) + " bpm"
        isPlayingMusic = true
        if user.musicSuggestions == true {
            setSuggestionLabel()
        }
        prevButton.hidden = false
        prevButton.enabled = true
        nextButton.hidden = false
        nextButton.enabled = true
    }
    
    func setSuggestionLabel() {
        if user.start == true {
            suggestedSongButton.setTitle("No suggestions", forState: UIControlState.Normal)
            suggestedSongButton.enabled = false
            moreButton.enabled = false
            moreButton.hidden = true
        }
        else {
            player.getSuggestionsByArtist(user.currentSongArtist)
            if player.suggestionsIndices[0] == -1 {
                player.getSuggestionByGenre(user.currentSongGenre)
                if player.suggestionsIndices[0] == -1 {
                    player.getSuggestionBySpeed(user.currentSongSpeed)
                    if player.suggestionsIndices[0] == -1 {
                        player.getSuggestionByLocation(user.currentLocation)
                        if player.suggestionsIndices[0] == -1 {
                            suggestedSongButton.setTitle("No suggestions", forState: UIControlState.Normal)
                            suggestedSongButton.enabled = false
                            moreButton.enabled = false
                            moreButton.hidden = true
                        }
                        else {
                            suggestedSongTitle = player.suggestionsTitles[0]
                            suggestedArtist = player.suggestionsArtists[0]
                            suggestedSongButton.setTitle(suggestedSongTitle + " - " + suggestedArtist, forState: UIControlState.Normal)
                            suggestedSongButton.enabled = true
                            moreButton.enabled = true
                            moreButton.hidden = false
                        }
                    }
                    else {
                        suggestedSongTitle = player.suggestionsTitles[0]
                        suggestedArtist = player.suggestionsArtists[0]
                        suggestedSongButton.setTitle(suggestedSongTitle + " - " + suggestedArtist, forState: UIControlState.Normal)
                        suggestedSongButton.enabled = true
                        moreButton.enabled = true
                        moreButton.hidden = false
                    }
                }
                else {
                    suggestedSongTitle = player.suggestionsTitles[0]
                    suggestedArtist = player.suggestionsArtists[0]
                    suggestedSongButton.setTitle(suggestedSongTitle + " - " + suggestedArtist, forState: UIControlState.Normal)
                    suggestedSongButton.enabled = true
                    moreButton.enabled = true
                    moreButton.hidden = false
                }
            }
            else {
                suggestedSongTitle = player.suggestionsTitles[0]
                suggestedArtist = player.suggestionsArtists[0]
                suggestedSongButton.setTitle(suggestedSongTitle + " - " + suggestedArtist, forState: UIControlState.Normal)
                suggestedSongButton.enabled = true
                moreButton.enabled = true
                moreButton.hidden = false
            }
        }
    }
    func playSuggestions(n: Int) {
        user.start = false
        player.pickSong(player.suggestionsIndices[n])
        playButton.setImage(pauseImage, forState: UIControlState.Normal)
        player.play()
        currentSongLabel.text = player.currentSongTitle + " - " + player.currentArtist
        currentSpeedLabel.text = String(user.currentSongSpeed) + " bpm"
        isPlayingMusic = true
        if user.musicSuggestions == true {
            setSuggestionLabel()
        }
    }
    
    func playPlaylist (n: Int) {
        user.start = false
        player.pickSong(player.playlistIndices[n])
        playButton.setImage(pauseImage, forState: UIControlState.Normal)
        player.play()
        currentSongLabel.text = player.currentSongTitle + " - " + player.currentArtist
        user.currentSongSpeed = player.playlistSpeed[n]
        currentSpeedLabel.text = String(user.currentSongSpeed) + " bpm"
        isPlayingMusic = true
        player.playSelectedPlaylist(playlistNumber)
        if user.musicSuggestions == true {
            setSuggestionLabel()
        }
        
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
            destinationVC?.player = self.player
        }
        else if segue.identifier == "mainToProfile" {
            let destinationVC = segue.destinationViewController as? ProfileViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
        }
        else if segue.identifier == "mainToSuggestBy" {
            let destinationVC = segue.destinationViewController as? SuggestByViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
        }
        else if segue.identifier == "mainToLogin" {
            self.user.start = true
            self.player.pause()
        }
    }
    
    
}
