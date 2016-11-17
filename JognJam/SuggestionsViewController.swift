//
//  SuggestionsViewController.swift
//  JognJam
//
//  Created by Team-ACED on 11/16/16.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import UIKit

class SuggestionsViewController: UIViewController {

    var user = userProfile()
    var player = musicPlayer()
    var suggestBy = ""
    @IBOutlet weak var suggestionsByLabel: UILabel!
    @IBOutlet weak var currentSpeedLabel: UILabel!
    @IBOutlet weak var currentLocationLabel: UILabel!
    
    @IBOutlet weak var songSuggestion1Label: UIButton!
    @IBOutlet weak var songSuggestion2Label: UIButton!
    @IBOutlet weak var songSuggestion3Label: UIButton!
    @IBOutlet weak var songSuggestion4Label: UIButton!
    @IBOutlet weak var songSuggestion5Label: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if suggestBy == "artist" {
            suggestionsByLabel.text = "Suggestions By Artist"
        }
        else if suggestBy == "genre" {
            suggestionsByLabel.text = "Suggestions By Genre"
        }
        else if suggestBy == "speed" {
            suggestionsByLabel.text = "Suggestions By Speed"
        }
        else if suggestBy == "location" {
            suggestionsByLabel.text = "Suggestions By Location"
        }
        //player.suggestionsUsed = [] //don't forget to include the current song! //=[user.currentSongIndex]
        //change more dynamically
        currentSpeedLabel.text = String(user.currentSpeed) + " km/h"
        currentLocationLabel.text = user.currentLocation
        getSuggestions()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func getSuggestions()
    {
        if suggestBy == "artist" {
            let currentArtist = user.currentSongArtist
            player.getSuggestionsByArtist(currentArtist)
            putSuggestionIntoLabel(songSuggestion1Label, num: 0)
            putSuggestionIntoLabel(songSuggestion2Label, num: 1)
            putSuggestionIntoLabel(songSuggestion3Label, num: 2)
            putSuggestionIntoLabel(songSuggestion4Label, num: 3)
            putSuggestionIntoLabel(songSuggestion5Label, num: 4)
                
        }
        else if suggestBy == "genre" {
            let currentGenre = user.currentSongGenre
            player.getSuggestionByGenre(currentGenre)
            putSuggestionIntoLabel(songSuggestion1Label, num: 0)
            putSuggestionIntoLabel(songSuggestion2Label, num: 1)
            putSuggestionIntoLabel(songSuggestion3Label, num: 2)
            putSuggestionIntoLabel(songSuggestion4Label, num: 3)
            putSuggestionIntoLabel(songSuggestion5Label, num: 4)
        }
        else if suggestBy == "speed" {
            let currentSpeed = user.currentSpeed
            player.getSuggestionBySpeed(currentSpeed)
            putSuggestionIntoLabel(songSuggestion1Label, num: 0)
            putSuggestionIntoLabel(songSuggestion2Label, num: 1)
            putSuggestionIntoLabel(songSuggestion3Label, num: 2)
            putSuggestionIntoLabel(songSuggestion4Label, num: 3)
            putSuggestionIntoLabel(songSuggestion5Label, num: 4)
        }
        else if suggestBy == "location" {
            let currentLocation = user.currentLocation
            player.getSuggestionByLocation(currentLocation)
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
            button.setTitle("No suggestions", forState: UIControlState.Normal)
            button.enabled = false //make it unclickable
        }
        else {
            button.setTitle((player.suggestionsTitles[num]+" - "+player.suggestionsArtists[num]), forState: UIControlState.Normal)
        }
    }
    @IBAction func song1Pressed(sender: UIButton) {
        user.currentSongTitle = player.suggestionsTitles[0]
        user.currentSongArtist = player.suggestionsArtists[0]
        user.currentSongGenre = player.suggestionsGenres[0]
        user.currentSongIndex = player.suggestionsIndices[0]
    }
    @IBAction func song2Pressed(sender: UIButton) {
        user.currentSongTitle = player.suggestionsTitles[1]
        user.currentSongArtist = player.suggestionsArtists[1]
        user.currentSongGenre = player.suggestionsGenres[1]
        user.currentSongIndex = player.suggestionsIndices[1]
    }
    @IBAction func song3Pressed(sender: UIButton) {
        user.currentSongTitle = player.suggestionsTitles[2]
        user.currentSongArtist = player.suggestionsArtists[2]
        user.currentSongGenre = player.suggestionsGenres[2]
        user.currentSongIndex = player.suggestionsIndices[2]
    }
    @IBAction func song4Pressed(sender: UIButton) {
        user.currentSongTitle = player.suggestionsTitles[3]
        user.currentSongArtist = player.suggestionsArtists[3]
        user.currentSongGenre = player.suggestionsGenres[3]
        user.currentSongIndex = player.suggestionsIndices[3]
    }
    @IBAction func song5Pressed(sender: UIButton) {
        user.currentSongTitle = player.suggestionsTitles[4]
        user.currentSongArtist = player.suggestionsArtists[4]
        user.currentSongGenre = player.suggestionsGenres[4]
        user.currentSongIndex = player.suggestionsIndices[4]
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
        if segue.identifier == "suggestionsToMainSong" {
            let destinationVC = segue.destinationViewController as? SettingsViewController
            destinationVC?.user = self.user
            
        }
    }
}
