//
//  SuggestionsViewController.swift
//  JognJam
//
//  Created by Team-ACED on 11/16/16.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import UIKit

class SuggestionsViewController: UIViewController {

    /* Maintain user and music player */
    var user = userProfile()
    var player = musicPlayer()
    
    @IBOutlet weak var profilePictureButton: UIButton!

    /* Labels to keep track of type of suggestion */
    @IBOutlet weak var suggestionsByLabel: UILabel!
    @IBOutlet weak var currentSuggestionAttributeLabel: UILabel!
    
    @IBOutlet weak var songSuggestion1Label: UIButton!
    @IBOutlet weak var songSuggestion2Label: UIButton!
    @IBOutlet weak var songSuggestion3Label: UIButton!
    @IBOutlet weak var songSuggestion4Label: UIButton!
    @IBOutlet weak var songSuggestion5Label: UIButton!
    
    /* See whether music is playing */
    var musicIsPlaying = true
    /* Current type of suggestions */
    var suggestBy = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Make status bar visible */
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        /* Update profile picture */
        profilePictureButton.setImage(user.picture, forState: UIControlState.Normal)
        
        if suggestBy == "artist" {
            suggestionsByLabel.text = "Suggestions By Artist"
            currentSuggestionAttributeLabel.text = "Current Artist: " + player.currentArtist
        }
        else if suggestBy == "genre" {
            suggestionsByLabel.text = "Suggestions By Genre"
            currentSuggestionAttributeLabel.text = "Current Genre: " + player.currentGenre
        }
        else if suggestBy == "speed" {
            suggestionsByLabel.text = "Suggestions By Speed"
            currentSuggestionAttributeLabel.text = "Current Speed: " + String(player.currentSongSpeed) + " bpm"
        }
        else if suggestBy == "location" {
            suggestionsByLabel.text = "Suggestions By Location"
            currentSuggestionAttributeLabel.text = "Current Location: " + player.locations[player.currentIndex]
        }
        getSuggestions()
        
        profilePictureButton.setImage(user.picture, forState: UIControlState.Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getSuggestions() {
        if suggestBy == "artist" {
            player.getSuggestionsByArtist(user.currentSongArtist)
            putSuggestionIntoLabel(songSuggestion1Label, num: 0)
            putSuggestionIntoLabel(songSuggestion2Label, num: 1)
            putSuggestionIntoLabel(songSuggestion3Label, num: 2)
            putSuggestionIntoLabel(songSuggestion4Label, num: 3)
            putSuggestionIntoLabel(songSuggestion5Label, num: 4)
                
        }
        else if suggestBy == "genre" {
            player.getSuggestionByGenre(user.currentSongGenre)
            putSuggestionIntoLabel(songSuggestion1Label, num: 0)
            putSuggestionIntoLabel(songSuggestion2Label, num: 1)
            putSuggestionIntoLabel(songSuggestion3Label, num: 2)
            putSuggestionIntoLabel(songSuggestion4Label, num: 3)
            putSuggestionIntoLabel(songSuggestion5Label, num: 4)
        }
        else if suggestBy == "speed" {
            player.getSuggestionBySpeed(user.currentSongSpeed)
            putSuggestionIntoLabel(songSuggestion1Label, num: 0)
            putSuggestionIntoLabel(songSuggestion2Label, num: 1)
            putSuggestionIntoLabel(songSuggestion3Label, num: 2)
            putSuggestionIntoLabel(songSuggestion4Label, num: 3)
            putSuggestionIntoLabel(songSuggestion5Label, num: 4)
        }
        else if suggestBy == "location" {
            player.getSuggestionByLocation(user.currentLocation)
            putSuggestionIntoLabel(songSuggestion1Label, num: 0)
            putSuggestionIntoLabel(songSuggestion2Label, num: 1)
            putSuggestionIntoLabel(songSuggestion3Label, num: 2)
            putSuggestionIntoLabel(songSuggestion4Label, num: 3)
            putSuggestionIntoLabel(songSuggestion5Label, num: 4)
        }
    }
    
    func putSuggestionIntoLabel(button: UIButton, num: Int)
    {
        if player.suggestionsIndices[num] == -1 {
            if num == 0 {
                button.setTitle("No suggestions", forState: UIControlState.Normal)
                button.enabled = false //make it unclickable
            }
            else
            {
                button.enabled = false
                button.hidden = true
            }
        }
        else {
            button.setTitle((player.suggestionsTitles[num]+" - "+player.suggestionsArtists[num]), forState: UIControlState.Normal)
        }
    }

    /* Segue preparation */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "suggestionsToMainSong1" {
            let destinationVC = segue.destinationViewController as? MainViewController
            user.start = false
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.fromSuggestions = 0
            
        }
            
        else if segue.identifier == "suggestionsToMainSong2" {
            let destinationVC = segue.destinationViewController as? MainViewController
            user.start = false
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.fromSuggestions = 1
            
        }
            
        else if segue.identifier == "suggestionsToMainSong3" {
            let destinationVC = segue.destinationViewController as? MainViewController
            user.start = false
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.fromSuggestions = 2
        }
            
        else if segue.identifier == "suggestionsToMainSong4" {
            let destinationVC = segue.destinationViewController as? MainViewController
            user.start = false
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.fromSuggestions = 3
        }
            
        else if segue.identifier == "suggestionsToMainSong5" {
            let destinationVC = segue.destinationViewController as? MainViewController
            user.start = false
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.fromSuggestions = 4
        }
            
        else if segue.identifier == "suggestionsToMain" {
            let destinationVC = segue.destinationViewController as? MainViewController
            user.start = false
            destinationVC?.user = self.user
            destinationVC?.player = self.player
        }
            
        else if segue.identifier == "suggestionsToLogin" {
            self.user.start = true
            self.player.pause()
        }
    }
}
