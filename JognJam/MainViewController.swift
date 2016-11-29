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
    
    var playlistNumber = -1
    var playlistSong = -1
    
    var user = userProfile()
    
    var time = 0
    
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
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Makes the status bar visible
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        //For gesture recognition (next song vs fast forward, previous song vs rewind)
        /*let nextTapGesture = UITapGestureRecognizer(target: nextButton, action: #selector(MainViewController.nextTapped))
        let nextLongPressGesture = UILongPressGestureRecognizer(target: nextButton, action: #selector(MainViewController.nextHeld))
        let prevTapGesture = UITapGestureRecognizer(target: prevButton, action: #selector(MainViewController.prevTapped))
        let prevLongPressGesture = UILongPressGestureRecognizer(target: prevButton, action: #selector(MainViewController.prevHeld))
        nextTapGesture.numberOfTapsRequired = 1
        nextLongPressGesture.numberOfTapsRequired = 1
        prevTapGesture.numberOfTapsRequired = 1
        prevLongPressGesture.numberOfTapsRequired = 1
        nextButton.addGestureRecognizer(nextTapGesture)
        nextButton.addGestureRecognizer(nextLongPressGesture)
        prevButton.addGestureRecognizer(prevTapGesture)
        prevButton.addGestureRecognizer(prevLongPressGesture)*/
        
        
        if start == true {
            user.startTracking()
            currentSongLabel.text = "No song playing"
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
        if player.songPlaying == true {
            playButton.setImage(pauseImage, forState: UIControlState.Normal)
            currentSongLabel.text = player.currentSongTitle + " - " + player.currentArtist
            currentSpeedLabel.text = String(user.currentSongSpeed) + " bpm"
            isPlayingMusic = true
            player.getSuggestionsByArtist(player.currentArtist)
            suggestedSongButton.setTitle(player.suggestionsTitles[0] + " - " + player.suggestionsArtists[0], forState: UIControlState.Normal)
        }
        
        
        setSuggestionLabel()
        profilePictureButton.setImage(user.picture, forState: UIControlState.Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func playButtonPressed(sender: UIButton) {
        if start == true { //pick a random song to play
            player.randomPick()
        }
        start = false
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
        setSuggestionLabel()
        prevButton.hidden = false
        prevButton.enabled = true
        nextButton.hidden = false
        nextButton.enabled = true
    }
    
    @IBAction func prevButtonPressed(sender: UIButton) {
        start = false
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
        setSuggestionLabel()
        prevButton.hidden = false
        prevButton.enabled = true

    }
    
    @IBAction func nextButtonPressed(sender: UIButton) { //button has been released
        print("touchUpInside")
        start = false
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
        setSuggestionLabel()
        prevButton.hidden = false
        prevButton.enabled = true
    }
    @IBAction func touchDown(sender: UIButton) { //button has been pressed
        print("touchDown")
        //time =
    }
    @IBAction func primaryActionTriggered(sender: UIButton) {
        print("primaryActionTriggered")
    }
    @IBAction func touchUpOutside(sender: UIButton) {
        print("touchUpOutside")
    }
    
    //Controls change depending on how long you hold
    func nextTapped() {
        start = false
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
        setSuggestionLabel()
        prevButton.hidden = false
        prevButton.enabled = true
        nextButton.hidden = false
        nextButton.enabled = true
    }
    func nextHeld() {
        start = false
        playButton.setImage(pauseImage, forState: UIControlState.Normal)
        player.fastforward()
        prevButton.hidden = false
        prevButton.enabled = true
        nextButton.hidden = false
        nextButton.enabled = true
    }
    func prevTapped() {
        start = false
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
        setSuggestionLabel()
        prevButton.hidden = false
        prevButton.enabled = true
        nextButton.hidden = false
        nextButton.enabled = true
    }
    func prevHeld() {
        start = false
        playButton.setImage(pauseImage, forState: UIControlState.Normal)
        player.rewind()
        prevButton.hidden = false
        prevButton.enabled = true
        nextButton.hidden = false
        nextButton.enabled = true
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
        user.currentLocation = player.currentLocation
        currentSpeedLabel.text = String(user.currentSongSpeed) + " bpm"
        player.play()
        setSuggestionLabel()
        playButton.setImage(pauseImage, forState: UIControlState.Normal)
        isPlayingMusic = true
        prevButton.hidden = false
        prevButton.enabled = true
    }
    
    func setSuggestionLabel() {
        if start == true {
            suggestedSongButton.setTitle("No suggestions", forState: UIControlState.Normal)
            suggestedSongButton.enabled = false
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
                        }
                        else {
                            suggestedSongButton.setTitle(player.suggestionsTitles[0] + " - " + player.suggestionsArtists[0], forState: UIControlState.Normal)
                            suggestedSongButton.enabled = true
                        }
                    }
                    else {
                        suggestedSongButton.setTitle(player.suggestionsTitles[0] + " - " + player.suggestionsArtists[0], forState: UIControlState.Normal)
                        suggestedSongButton.enabled = true
                    }
                }
                else {
                    suggestedSongButton.setTitle(player.suggestionsTitles[0] + " - " + player.suggestionsArtists[0], forState: UIControlState.Normal)
                    suggestedSongButton.enabled = true
                }
            }
            else {
                suggestedSongButton.setTitle(player.suggestionsTitles[0] + " - " + player.suggestionsArtists[0], forState: UIControlState.Normal)
                suggestedSongButton.enabled = true
            }
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
    
    func playPlaylist (n: Int) {
        start = false
        player.pickSong(player.playlistIndices[n])
        playButton.setImage(pauseImage, forState: UIControlState.Normal)
        player.play()
        currentSongLabel.text = player.currentSongTitle + " - " + player.currentArtist
        user.currentSongSpeed = player.playlistSpeed[n]
        currentSpeedLabel.text = String(user.currentSongSpeed) + " bpm"
        isPlayingMusic = true
        player.playSelectedPlaylist(playlistNumber)
        suggestedSongButton.setTitle(player.suggestionsTitles[0] + " - " + player.suggestionsArtists[0], forState: UIControlState.Normal)
        suggestedSongButton.enabled = true
        
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
            destinationVC?.player = self.player
        }
        else if segue.identifier == "mainToLogin" {
            self.player.pause()
            //user.stopTracking()
        }
    }
    
    
}
