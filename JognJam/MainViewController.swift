//
//  MainViewController.swift
//  JognJam
//
//  Created by Team-ACED on 2016-11-09.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var user = userProfile()
    var player = musicPlayer()
    
    @IBOutlet weak var profilePictureButton: UIButton!
    
    @IBOutlet weak var currentSongLabel: UILabel!
    @IBOutlet weak var currentSpeedLabel: UILabel!
    
    @IBOutlet weak var randomiseButton: UIButton!
    
    @IBOutlet weak var suggestionsLabel: UILabel!
    @IBOutlet weak var suggestedSongButton: UIButton!
    @IBOutlet weak var moreButton: UIButton!
    
    @IBOutlet weak var playButton: UIButton!

    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var createNewPlaylistButton: UIButton!

    var currentSpeedOfSong = 0
    
    var suggestedSongTitle = ""
    var suggestedArtist = ""
    var fromSuggestions = -1
    
    /* Images for play/pause button */
    let playImage = UIImage(named: "playButton.png")
    let pauseImage = UIImage(named: "pauseButton.png")
    
    /* Boolean to show that music is playing and the play button is the pause image */
    var isPlayingMusic = false

    /* Current number of playlists */
    var numPlaylists = 0
    /* Which number playlist is being played */
    var playlistNumber = -1
    /* Which song on the given playlist is being played */
    var playlistSong = -1
    
    /* If playing most played song, which index */
    var mostPlayedSongIndice = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Make status bar visible */
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        /* Update profile picture */
        profilePictureButton.setImage(user.picture, forState: UIControlState.Normal)
        
        /* State before any music has been played */
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
            
        /* Current song */
        else if fromSuggestions == -1 && (playlistNumber == -1 || playlistSong == -1) && mostPlayedSongIndice == -1 {
            currentSongLabel.text = player.currentSongTitle + " - " + player.currentArtist
            prevButton.hidden = false
            prevButton.enabled = true
            nextButton.hidden = false
            nextButton.enabled = true
        }
            
        /* Playing a playlist */
        else if playlistNumber != -1 && playlistSong != -1 {
            if (playlistNumber == 0) {
                playPlaylist1(playlistSong)
            }
            if (playlistNumber == 1) {
                playPlaylist2(playlistSong)
            }
            if (playlistNumber == 2) {
                playPlaylist3(playlistSong)
            }
            if (playlistNumber == 3) {
                playPlaylist4(playlistSong)
            }
            if (playlistNumber == 4) {
                playPlaylist5(playlistSong)
            }
            prevButton.hidden = false
            prevButton.enabled = true
            nextButton.hidden = false
            nextButton.enabled = true
        }
        
        /* Playing most played songs */
        else if mostPlayedSongIndice != -1 {
            playMostPlayed(mostPlayedSongIndice)
            prevButton.hidden = false
            prevButton.enabled = true
            nextButton.hidden = false
            nextButton.enabled = true
        }
            
        
        /* Play suggestions */
        else {
            playSuggestions(fromSuggestions)
            prevButton.hidden = false
            prevButton.enabled = true
            nextButton.hidden = false
            nextButton.enabled = true
        }
        
        /* Current song information */
        user.currentSongTitle = player.currentSongTitle
        user.currentSongArtist = player.currentArtist
        user.currentSongIndex = player.currentIndex
        user.currentSongSpeed = player.currentSongSpeed
        user.currentLocation = player.currentLocation
        currentSpeedLabel.text = String(player.currentSongSpeed) + " bpm"
        
        /* If the user turns off song suggestions, hide them */
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
        
        /* If song is playing, display information */
        if player.songPlaying == true {
            playButton.setImage(pauseImage, forState: UIControlState.Normal)
            currentSongLabel.text = player.currentSongTitle + " - " + player.currentArtist
            currentSpeedLabel.text = String(user.currentSongSpeed) + " bpm"
            isPlayingMusic = true
            if user.musicSuggestions == true {
                setSuggestionLabel()
            }
        }
        
        /* Hide the create new playlist button if they already have 5 playlists created */
        for i in 0...4 {
            if (user.playlists[i]) {
                numPlaylists += 1
            }
        }
        
        /* Otherwise, let them create a new playlist from the main page */
        if (numPlaylists == 5) {
            createNewPlaylistButton.hidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /* Pressed play button */
    @IBAction func playButtonPressed(sender: UIButton) {
        /* Play a random song */
        if user.start == true {
            player.randomPick()
        }
        
        user.start = false
        /* Current song information */
        currentSongLabel.text = player.currentSongTitle + " - " + player.currentArtist
        user.currentSongTitle = player.currentSongTitle
        user.currentSongArtist = player.currentArtist
        user.currentSongGenre = player.currentGenre
        user.currentSongIndex = player.currentIndex
        user.currentSongSpeed = player.currentSongSpeed
        user.currentLocation = player.currentLocation
        currentSpeedLabel.text = String(user.currentSongSpeed) + " bpm"
        
        /* Changes image based on whether music is playing or paused */
        isPlayingMusic = !isPlayingMusic
        if isPlayingMusic == true {
            playButton.setImage(pauseImage, forState: UIControlState.Normal)
            player.play()
        }
        else {
            playButton.setImage(playImage, forState: UIControlState.Normal)
            player.pause()
        }
        
        /* Display suggestions if user has them turned on */
        if user.musicSuggestions == true {
            setSuggestionLabel()
        }
        
        prevButton.hidden = false
        prevButton.enabled = true
        nextButton.hidden = false
        nextButton.enabled = true
    }
    
    /* Pressed previous button */
    @IBAction func prevButtonPressed(sender: UIButton) {
        user.start = false
        playButton.setImage(pauseImage, forState: UIControlState.Normal)
        player.prev()
        player.play()
        /* Current song information */
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
    
    /* Pressed next button */
    @IBAction func nextButtonPressed(sender: UIButton) {
        user.start = false
        playButton.setImage(pauseImage, forState: UIControlState.Normal)
        player.next()
        player.play()
        /* Current song information */
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
    
    /* If the user selects a suggestion song, play it */
    @IBAction func suggestionSongPressed(sender: UIButton) {
        user.start = false
        playButton.setImage(pauseImage, forState: UIControlState.Normal)
        player.suggestionPressed()
        player.play()
        /* Current song information */
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
    
    /* If the user selects randomise, play random songs */
    @IBAction func randomiseButtonPressed(sender: AnyObject) {
        player.randomised = true
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
    
    /* Set label based on suggestions */
    func setSuggestionLabel() {
        /* If music hasn't started, no suggestions */
        if user.start == true {
            suggestedSongButton.setTitle("No suggestions", forState: UIControlState.Normal)
            suggestedSongButton.enabled = false
            moreButton.enabled = false
            moreButton.hidden = true
        }
        /* Otherwise, provide suggestions as desired */
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
    
    /* Play selected suggestions */
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
    
    /* Play a given playlist */
    func playPlaylist1 (n: Int) {
        var count = n
        if (count < 5) {
            /* Make sure that only one playlist is playing */
            player.playingPlaylist1 = true
            player.playingPlaylist2 = false
            player.playingPlaylist3 = false
            player.playingPlaylist4 = false
            player.playingPlaylist5 = false
            player.playingMostPlayed = false

            player.playlistIndex = count
            
            user.start = false
            player.pickSong(player.playlist1Indices[count])
            playButton.setImage(pauseImage, forState: UIControlState.Normal)
            player.play()
            currentSongLabel.text = player.currentSongTitle + " - " + player.currentArtist
            user.currentSongSpeed = player.playlist1Speed[count]
            currentSpeedLabel.text = String(user.currentSongSpeed) + " bpm"
            isPlayingMusic = true
            player.playSelectedPlaylist(playlistNumber)
            if user.musicSuggestions == true {
                setSuggestionLabel()
            }
            /* Play next song in playlist */
            count += 1
            
        }
        
    }
    
    func playPlaylist2 (n: Int) {
        var count = n
        if (count < 5) {
            player.playingPlaylist2 = true
            player.playingPlaylist1 = false
            player.playingPlaylist3 = false
            player.playingPlaylist4 = false
            player.playingPlaylist5 = false
            player.playingMostPlayed = false
            
            player.playlistIndex = count

            user.start = false
            player.pickSong(player.playlist2Indices[count])
            playButton.setImage(pauseImage, forState: UIControlState.Normal)
            player.play()
            currentSongLabel.text = player.currentSongTitle + " - " + player.currentArtist
            user.currentSongSpeed = player.playlist2Speed[count]
            currentSpeedLabel.text = String(user.currentSongSpeed) + " bpm"
            isPlayingMusic = true
            player.playSelectedPlaylist(playlistNumber)
            if user.musicSuggestions == true {
                setSuggestionLabel()
            }
            count += 1
        }
    
    }
    
    func playPlaylist3 (n: Int) {
        var count = n
        if (count < 5) {
            player.playingPlaylist3 = true
            player.playingPlaylist1 = false
            player.playingPlaylist2 = false
            player.playingPlaylist4 = false
            player.playingPlaylist5 = false
            player.playingMostPlayed = false
            
            player.playlistIndex = count

            user.start = false
            player.pickSong(player.playlist3Indices[count])
            playButton.setImage(pauseImage, forState: UIControlState.Normal)
            player.play()
            currentSongLabel.text = player.currentSongTitle + " - " + player.currentArtist
            user.currentSongSpeed = player.playlist3Speed[count]
            currentSpeedLabel.text = String(user.currentSongSpeed) + " bpm"
            isPlayingMusic = true
            player.playSelectedPlaylist(playlistNumber)
            if user.musicSuggestions == true {
                setSuggestionLabel()
            }
            count += 1
        }
        
    }
    
    func playPlaylist4 (n: Int) {
        var count = n
        if (count < 5) {
            player.playingPlaylist4 = true
            player.playingPlaylist1 = false
            player.playingPlaylist2 = false
            player.playingPlaylist3 = false
            player.playingPlaylist5 = false
            player.playingMostPlayed = false
            
            player.playlistIndex = count
            

            user.start = false
            player.pickSong(player.playlist4Indices[count])
            playButton.setImage(pauseImage, forState: UIControlState.Normal)
            player.play()
            currentSongLabel.text = player.currentSongTitle + " - " + player.currentArtist
            user.currentSongSpeed = player.playlist4Speed[count]
            currentSpeedLabel.text = String(user.currentSongSpeed) + " bpm"
            isPlayingMusic = true
            player.playSelectedPlaylist(playlistNumber)
            if user.musicSuggestions == true {
                setSuggestionLabel()
            }
            count += 1
        }
        
    }
    
    func playPlaylist5 (n: Int) {
        var count = n
        if (count < 5) {
            player.playingPlaylist5 = true
            player.playingPlaylist1 = false
            player.playingPlaylist2 = false
            player.playingPlaylist3 = false
            player.playingPlaylist4 = false
            player.playingMostPlayed = false
            
            player.playlistIndex = count

            user.start = false
            player.pickSong(player.playlist5Indices[count])
            playButton.setImage(pauseImage, forState: UIControlState.Normal)
            player.play()
            currentSongLabel.text = player.currentSongTitle + " - " + player.currentArtist
            user.currentSongSpeed = player.playlist5Speed[count]
            currentSpeedLabel.text = String(user.currentSongSpeed) + " bpm"
            isPlayingMusic = true
            player.playSelectedPlaylist(playlistNumber)
            if user.musicSuggestions == true {
                setSuggestionLabel()
            }
            count += 1
        }
        
    }
    
    /* Play the msot played music */
    func playMostPlayed (n: Int) {
        var count = n
        if (count < 5) {
            /* Make sure playlists aren't playing in the background */
            player.playingMostPlayed = true
            player.playingPlaylist1 = false
            player.playingPlaylist2 = false
            player.playingPlaylist3 = false
            player.playingPlaylist4 = false
            player.playingPlaylist5 = false
            
            player.mostPlayedSongIndex = count
            user.start = false
            player.pickSong(player.mostPlayedIndices[count])
            playButton.setImage(pauseImage, forState: UIControlState.Normal)
            player.play()
            currentSongLabel.text = player.currentSongTitle + " - " + player.currentArtist
            user.currentSongSpeed = player.playlist4Speed[count]
            currentSpeedLabel.text = String(user.currentSongSpeed) + " bpm"
            isPlayingMusic = true
            if user.musicSuggestions == true {
                setSuggestionLabel()
            }
            /* Keep playing most listen to music */
            count += 1
        }
        
    }
    
    /* Segue preparation */
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
            
        else if segue.identifier == "mainToCreatePlaylist" {
            let destinationVC = segue.destinationViewController as? CreatePlaylistViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
        }
            
        else if segue.identifier == "mainToLogin" {
            self.user.start = true
            self.player.pause()
        }
    }
    
    
}
