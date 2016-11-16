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
        if suggestBy == "arist" {
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
        if user.onlineMode == true { //on online mode
            if suggestBy == "artist" {
                //calculate suggestion (from internet)
                let currentArtist = user.currentSongArtist
                player.getSuggestionByArtist(currentArtist)
                player.getSuggestionByArtist(currentArtist)
                player.getSuggestionByArtist(currentArtist)
                player.getSuggestionByArtist(currentArtist)
                songSuggestion1Label.setTitle(((player.suggestionsTitles[0] as! String) + " - " + (player.suggestionsArtists[0] as! String)), forState: UIControlState.Normal)
                /*
                var a = player.getSuggestionByArtist(currentArtist)
                putSuggestionIntoLabel(songSuggestion1Label, num: a)
                a = player.getSuggestionByArtist(currentArtist)
                putSuggestionIntoLabel(songSuggestion2Label, num: a)
                a = player.getSuggestionByArtist(currentArtist)
                putSuggestionIntoLabel(songSuggestion3Label, num: a)
                a = player.getSuggestionByArtist(currentArtist)
                putSuggestionIntoLabel(songSuggestion4Label, num: a)
                a = player.getSuggestionByArtist(currentArtist)
                putSuggestionIntoLabel(songSuggestion5Label, num: a)*/
                
            }
            else if suggestBy == "genre" {
                let currentGenre = user.currentSongGenre
                var a = player.getSuggestionByGenre(currentGenre)
                putSuggestionIntoLabel(songSuggestion1Label, num: a)
                a = player.getSuggestionByGenre(currentGenre)
                putSuggestionIntoLabel(songSuggestion2Label, num: a)
                a = player.getSuggestionByGenre(currentGenre)
                putSuggestionIntoLabel(songSuggestion3Label, num: a)
                a = player.getSuggestionByGenre(currentGenre)
                putSuggestionIntoLabel(songSuggestion4Label, num: a)
                a = player.getSuggestionByGenre(currentGenre)
                putSuggestionIntoLabel(songSuggestion5Label, num: a)
            }
            else if suggestBy == "speed" {
                let currentSpeed = user.currentSpeed
                var a = player.getSuggestionBySpeed(currentSpeed)
                putSuggestionIntoLabel(songSuggestion1Label, num: a)
                a = player.getSuggestionBySpeed(currentSpeed)
                putSuggestionIntoLabel(songSuggestion2Label, num: a)
                a = player.getSuggestionBySpeed(currentSpeed)
                putSuggestionIntoLabel(songSuggestion3Label, num: a)
                a = player.getSuggestionBySpeed(currentSpeed)
                putSuggestionIntoLabel(songSuggestion4Label, num: a)
                a = player.getSuggestionBySpeed(currentSpeed)
                putSuggestionIntoLabel(songSuggestion5Label, num: a)
            }
            else if suggestBy == "location" {
                let currentLocation = user.currentLocation
                var a = player.getSuggestionByLocation(currentLocation)
                putSuggestionIntoLabel(songSuggestion1Label, num: a)
                a = player.getSuggestionByLocation(currentLocation)
                putSuggestionIntoLabel(songSuggestion2Label, num: a)
                a = player.getSuggestionByLocation(currentLocation)
                putSuggestionIntoLabel(songSuggestion3Label, num: a)
                a = player.getSuggestionByLocation(currentLocation)
                putSuggestionIntoLabel(songSuggestion4Label, num: a)
                a = player.getSuggestionByLocation(currentLocation)
                putSuggestionIntoLabel(songSuggestion5Label, num: a)
            }
        }
    }
    func putSuggestionIntoLabel(button: UIButton, num: Int)
    {
        if num == -1 {
            button.setTitle("No suggestions", forState: UIControlState.Normal)
            button.enabled = false //make it unclickable
        }
        else {
            button.setTitle((player.titles[num]+" - "+player.artists[num]), forState: UIControlState.Normal)
        }
    }
    @IBAction func song1Pressed(sender: UIButton) {
        let a = player.suggestionsUsed[0] as! Int //when you put in currentSong, will be suggestionsUsed[a]!!
        user.currentSongTitle = player.titles[a]
        user.currentSongArtist = player.artists[a]
        user.currentSongGenre = player.genres[a]
        user.currentSongIndex = a
    }
    @IBAction func song2Pressed(sender: UIButton) {
        let a = player.suggestionsUsed[1] as! Int //when you put in currentSong, will be suggestionsUsed[a]!!
        user.currentSongTitle = player.titles[a]
        user.currentSongArtist = player.artists[a]
        user.currentSongGenre = player.genres[a]
        user.currentSongIndex = a
    }
    @IBAction func song3Pressed(sender: UIButton) {
        let a = player.suggestionsUsed[2] as! Int //when you put in currentSong, will be suggestionsUsed[a]!!
        user.currentSongTitle = player.titles[a]
        user.currentSongArtist = player.artists[a]
        user.currentSongGenre = player.genres[a]
        user.currentSongIndex = a
    }
    @IBAction func song4Pressed(sender: UIButton) {
        let a = player.suggestionsUsed[3] as! Int //when you put in currentSong, will be suggestionsUsed[a]!!
        user.currentSongTitle = player.titles[a]
        user.currentSongArtist = player.artists[a]
        user.currentSongGenre = player.genres[a]
        user.currentSongIndex = a
    }
    @IBAction func song5Pressed(sender: UIButton) {
        let a = player.suggestionsUsed[4] as! Int //when you put in currentSong, will be suggestionsUsed[a]!!
        user.currentSongTitle = player.titles[a]
        user.currentSongArtist = player.artists[a]
        user.currentSongGenre = player.genres[a]
        user.currentSongIndex = a
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
