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
    var fromSuggestions = -1
    
    var user = userProfile()
    
    @IBOutlet weak var currentSpeedLabel: UILabel!
    var currentSpeedOfSong = 0
    
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var suggestionsLabel: UILabel!
    
    @IBOutlet weak var suggestedSongButton: UIButton!
    var suggestedSongTitle = ""
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
        if player.currentSongTitle == "" && player.currentArtist == "" {
            currentSongLabel.text = "No song playing"
        }
        else if fromSuggestions == -1{
            currentSongLabel.text = player.currentSongTitle + " - " + player.currentArtist
        }
        else {
            playSuggestions(fromSuggestions)
        }
        user.currentSongTitle = player.currentSongTitle
        user.currentSongArtist = player.currentArtist
        user.currentSongIndex = player.currentIndex
        user.currentSongSpeed = player.currentSongSpeed
        currentSpeedLabel.text = String(currentSpeedOfSong) + " bpm"
        if suggestedSongTitle == "" && suggestedArtist == "" {
            suggestedSongButton.setTitle("No suggestions", forState: UIControlState.Normal)
            suggestedSongButton.enabled = false
        }
        else if fromSuggestions == -1{
            suggestedSongButton.setTitle((suggestedSongTitle + " - " + suggestedArtist), forState: UIControlState.Normal)
            suggestedSongButton.enabled = true
        }
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
        user.currentSongSpeed = player.currentSongSpeed
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
        player.getSuggestionsByArtist(user.currentSongArtist)
        suggestedSongButton.setTitle(player.suggestionsTitles[0] + " - " + player.suggestionsArtists[0], forState: UIControlState.Normal)
        suggestedSongButton.enabled = true
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
        user.currentSongSpeed = player.currentSongSpeed
        currentSpeedLabel.text = String(user.currentSongSpeed) + " bpm"
        isPlayingMusic = true
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
        user.currentSongSpeed = player.currentSongSpeed
        currentSpeedLabel.text = String(user.currentSongSpeed) + " bpm"
        isPlayingMusic = true
    }

    @IBAction func suggestionSongPressed(sender: UIButton) {
        player.pause()
        player.pickSong(player.suggestionsIndices[0])
        currentSongLabel.text = player.currentSongTitle + " - " + player.currentArtist
        user.currentSongTitle = player.currentSongTitle
        user.currentSongArtist = player.currentArtist
        user.currentSongGenre = player.currentGenre
        user.currentSongIndex = player.currentIndex
        user.currentSongSpeed = player.currentSongSpeed
        currentSpeedLabel.text = String(user.currentSongSpeed) + " bpm"
        player.play()
        player.getSuggestionsByArtist(user.currentSongArtist)
        suggestedSongButton.setTitle(player.suggestionsTitles[0] + " - " + player.suggestionsArtists[0], forState: UIControlState.Normal)
        playButton.setImage(pauseImage, forState: UIControlState.Normal)
        isPlayingMusic = true
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
            destinationVC?.player = self.player
        }
    }
    func playSuggestions(n: Int) {
        start = false
        player.pickSong(player.suggestionsIndices[n])
        playButton.setImage(pauseImage, forState: UIControlState.Normal)
        player.play()
        currentSongLabel.text = player.currentSongTitle + " - " + player.currentArtist
        currentSpeedLabel.text = String(user.currentSongSpeed) + " bpm"
        isPlayingMusic = true
        player.getSuggestionsByArtist(player.currentArtist)
        suggestedSongButton.setTitle(player.suggestionsTitles[0] + " - " + player.suggestionsArtists[0], forState: UIControlState.Normal)
        suggestedSongButton.enabled = true
    }
}
