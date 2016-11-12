//
//  MainViewController.swift
//  JognJam
//
//  Created by Angela Dini on 2016-11-09.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var currentSongLabel: UILabel!
    
    var player = musicPlayer()
    var start = true
    
    @IBOutlet weak var currentSpeedLabel: UILabel!
    var currentSpeed = 0 //Get data from accelerometer
    
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var suggestionsLabel: UILabel!
    @IBOutlet weak var suggestedSongLabel: UILabel!
    var suggestSongTitle = ""
    var suggestedArtist = ""
    
    //boolean to show that music is playing and the play button is the pause image
    var isPlayingMusic = false
    @IBOutlet weak var playButton: UIButton!
    let playImage = UIImage(named: "playButton.png")
    let pauseImage = UIImage(named: "pauseButton.png")
    
    //for suggestions
    var showSuggestions = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currentSongLabel.text = player.currentSongTitle + " - " + player.currentArtist
        currentSpeedLabel.text = String(currentSpeed) + " km/h"
        suggestedSongLabel.text = suggestSongTitle + " - " + suggestedArtist
        if showSuggestions == false {
            suggestedSongLabel.hidden = true
            suggestionsLabel.hidden = true
            moreButton.hidden = true
        }
        else {
            suggestedSongLabel.hidden = false
            suggestionsLabel.hidden = false
            moreButton.hidden = false
        }
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
    }
    
    @IBAction func prevButtonPressed(sender: UIButton) {
        player.pickSong(0) //or pick a different song
        start = false
        playButton.setImage(playImage, forState: UIControlState.Normal)
        player.pause()
        currentSongLabel.text = player.currentSongTitle + " - " + player.currentArtist
    }
    
    @IBAction func nextButtonPressed(sender: UIButton) {
        player.pickSong(0) //or pick a different song
        start = false
        playButton.setImage(playImage, forState: UIControlState.Normal)
        player.pause()
        currentSongLabel.text = player.currentSongTitle + " - " + player.currentArtist
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
