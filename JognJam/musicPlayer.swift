//
//  musicPlayer.swift
//  JognJam
//
//  Created by Team-ACED on 2016-11-12.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class musicPlayer
{
    //Database of songs
    var songs = ["Quote"] // list of songs, can change later, 3/4 for demo? using the one in the TA's github
    var artists = ["Forrest Gump"] //list of artists, can change later, 3/4 for demo? using the one in the TA's github
    var songFile = ["movie_quote"] //list of song files associated with song and artist
    var currentSongTitle=""
    var currentArtist = ""
    var currentSongFile = ""
    var audioPlayer = AVAudioPlayer()
    
    func pickSong(n: Int) {
        currentSongTitle = songs[n]
        currentArtist = artists[n]
        currentSongFile = songFile[n]
        let songSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(currentSongFile, ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOfURL: songSound)
        } catch {
            print("Cannot find audio")
        }
        audioPlayer.prepareToPlay()
    }
    func play()
    {
        audioPlayer.play()
    }
    func pause()
    {
        audioPlayer.stop()
    }
}