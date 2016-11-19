//
//  userProfile.swift
//  JognJam
//
//  Created by Team-ACED on 2016-11-12.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import Foundation
import UIKit

//class that holds information for each user's profile
class userProfile
{
    //var routes
    //var playlists
    var picture = UIImage(named: "Logo2_Square.png") //picture used for profile picture
    var numberSteps = 0
    var currentSpeed = 0
    var highestSpeed = 1
    
    var currentLocation = "" //for suggestions
    var currentSongTitle = ""
    var currentSongArtist = ""
    var currentSongGenre = ""
    var currentSongIndex = -1
    var currentSongSpeed = 0
    
    //Settings
    var locationServices = true
    var onlineMode = false
    var musicSuggestions = true
    var voiceControl = true
    
    func setLocationServices(locS: Bool) {
        locationServices = locS
    }
    func setOnlineMode(onM: Bool) {
        onlineMode = onM
    }
    func setMusicSuggestions(musS: Bool) {
        musicSuggestions = musS
    }
    func setVoiceControl(voiceC: Bool) {
        voiceControl = voiceC
    }
    
}