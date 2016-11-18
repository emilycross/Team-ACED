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
    var musicIsPlaying = true
    var suggestBy = ""
    
    @IBOutlet weak var suggestionsByLabel: UILabel!
    @IBOutlet weak var currentSpeedLabel: UILabel!
    @IBOutlet weak var currentLocationLabel: UILabel!
    
    @IBOutlet weak var songSuggestion1Label: UIButton!
    @IBOutlet weak var songSuggestion2Label: UIButton!
    @IBOutlet weak var songSuggestion3Label: UIButton!
    @IBOutlet weak var songSuggestion4Label: UIButton!
    @IBOutlet weak var songSuggestion5Label: UIButton!
    
    @IBOutlet weak var profilePictureButton: UIButton!
    
    
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
        
        profilePictureButton.setImage(user.picture, forState: UIControlState.Normal)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "suggestionsToMainSong1" {
            let destinationVC = segue.destinationViewController as? MainViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.fromSuggestions = 0
            
        }
        else if segue.identifier == "suggestionsToMainSong2" {
            let destinationVC = segue.destinationViewController as? MainViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.fromSuggestions = 1
            
        }
        else if segue.identifier == "suggestionsToMainSong3" {
            let destinationVC = segue.destinationViewController as? MainViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.fromSuggestions = 2
            
        }
        else if segue.identifier == "suggestionsToMainSong4" {
            let destinationVC = segue.destinationViewController as? MainViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.fromSuggestions = 3
            
        }
        else if segue.identifier == "suggestionsToMainSong5" {
            let destinationVC = segue.destinationViewController as? MainViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.fromSuggestions = 4
            
        }
    }
}
