//
//  MostPlayedSongsViewController.swift
//  JognJam
//
//  Created by Emily Cross on 2016-12-05.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import UIKit

class MostPlayedSongsViewController: UIViewController {

    
    var user = userProfile()
    var player = musicPlayer()
    
    var numTimes = [0, 0, 0, 0, 0]
    var songIndices = [-1, -1, -1, -1, -1]

    /* Button and corresponding label to show each song and the number of times it was played */
    @IBOutlet weak var song1: UIButton!
    @IBOutlet weak var song1NumTimes: UILabel!
    
    @IBOutlet weak var song2: UIButton!
    @IBOutlet weak var song2NumTimes: UILabel!
    
    @IBOutlet weak var song3: UIButton!
    @IBOutlet weak var song3NumTimes: UILabel!
    
    @IBOutlet weak var song4: UIButton!
    @IBOutlet weak var song4NumTimes: UILabel!
    
    @IBOutlet weak var song5: UIButton!
    @IBOutlet weak var song5NumTimes: UILabel!
    
    @IBOutlet weak var profilePictureButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /* Make status bar visible */
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        /* Update profile picture */
        profilePictureButton.setImage(user.picture, forState: UIControlState.Normal)
        
        /* Number of times all songs in database were played */
        var timesPlayed = player.numberOfTimesPlayed
        /* Sort the number of times each song was played */
        var sortedTimesPlayed = player.numberOfTimesPlayed.sort()
        
        /* Find most played song - similar methods for all top 5 songs */
        for i in 0...4 {
            numTimes[i] = sortedTimesPlayed[i]
            if (i == 0) {
                song1NumTimes.text = "Played " + String(sortedTimesPlayed[10]) + " Times"
                for j in 0...10 {
                    /* Songs are sorted in ascending order, so the last song should be first */
                    if (timesPlayed[j] == sortedTimesPlayed[10]) {
                        if !(sortedTimesPlayed[10] == 0) {
                            songIndices[0] = j
                            /* Display the song */
                            displaySong(song1, num: j)
                        }
                        else {
                            displaySong(song1, num: -1)
                        }
                    }
                }
                
            }
            
            else if (i == 1) {
                song2NumTimes.text = "Played " + String(sortedTimesPlayed[9]) + " Times"
                for j in 0...10 {
                    if (timesPlayed[j] == sortedTimesPlayed[9] && !songIndices.contains(j)) {
                        if !(sortedTimesPlayed[9] == 0) {
                            songIndices[1] = j
                            displaySong(song2, num: j)
                        }
                        else {
                            displaySong(song2, num: -1)
                        }
                    }
                }
            }
            
            else if (i == 2) {
                song3NumTimes.text = "Played " + String(sortedTimesPlayed[8]) + " Times"
                for j in 0...10 {
                    if (timesPlayed[j] == sortedTimesPlayed[8] && !songIndices.contains(j)) {
                        if !(sortedTimesPlayed[8] == 0) {
                            songIndices[2] = j
                            displaySong(song3, num: j)
                        }
                        else {
                            displaySong(song3, num: -1)
                        }
                    }
                }
            }
            
            else if (i == 3) {
                song4NumTimes.text = "Played " + String(sortedTimesPlayed[7]) + " Times"
                for j in 0...10 {
                    if (timesPlayed[j] == sortedTimesPlayed[7] && !songIndices.contains(j)) {
                        if !(sortedTimesPlayed[7] == 0) {
                            songIndices[3] = j
                            displaySong(song4, num: j)
                        }
                        else {
                            displaySong(song4, num: -1)
                        }
                    }
                }
            }
            
            else if (i == 4) {
                song5NumTimes.text = "Played " + String(sortedTimesPlayed[6]) + " Times"
                for j in 0...10 {
                    if (timesPlayed[j] == sortedTimesPlayed[6] && !songIndices.contains(j)) {
                        if !(sortedTimesPlayed[6] == 0) {
                            songIndices[4] = j
                            displaySong(song5, num: j)
                        }
                        else {
                            displaySong(song5, num: -1)
                        }
                    }
                }
            }
        }
    }


    func displaySong(button: UIButton, num: Int)
    {
        if (num == -1) {
            button.setTitle("No song available", forState: UIControlState.Normal)
            button.enabled = false
        }
                
        else {
            button.setTitle((player.titles[num]+" - "+player.artists[num]), forState: UIControlState.Normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    /* Segue preparation */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "songOneToMain" {
            let destinationVC = segue.destinationViewController as? MainViewController
            user.start = false
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.mostPlayedSongIndice = 0
            destinationVC?.player.mostPlayedIndices = songIndices
            
        }
        else if segue.identifier == "songTwoToMain" {
            let destinationVC = segue.destinationViewController as? MainViewController
            user.start = false
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.mostPlayedSongIndice = 1
            destinationVC?.player.mostPlayedIndices = songIndices

            
        }
        else if segue.identifier == "songThreeToMain" {
            let destinationVC = segue.destinationViewController as? MainViewController
            user.start = false
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.mostPlayedSongIndice = 2
            destinationVC?.player.mostPlayedIndices = songIndices

            
        }
        else if segue.identifier == "songFourToMain" {
            let destinationVC = segue.destinationViewController as? MainViewController
            user.start = false
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.mostPlayedSongIndice = 3
            destinationVC?.player.mostPlayedIndices = songIndices

            
        }
        else if segue.identifier == "songFiveToMain" {
            let destinationVC = segue.destinationViewController as? MainViewController
            user.start = false
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.mostPlayedSongIndice = 4
            destinationVC?.player.mostPlayedIndices = songIndices
        }

        else if segue.identifier == "mostPlayedSongsToPlaylist" {
            let destinationVC = segue.destinationViewController as? PlaylistViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
        }
            
        else if segue.identifier == "mostPlayedSongsToProfile" {
            let destinationVC = segue.destinationViewController as? ProfileViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
        }
        else if segue.identifier == "mostPlayedSongsToLogin" {
            self.user.start = true
            self.player.pause()
        }
        
        
    }
    
    
    

}
