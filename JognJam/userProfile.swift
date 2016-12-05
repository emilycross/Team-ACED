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
class userProfile {
    //var routes
    //var playlists
    var username = "" //example, change later **
    var picture = UIImage(named: "Logo2_Square.png") //picture used for profile picture
    var numberSteps = 0
    
    var start = true
    
    var currentLocation = "" //for suggestions
    var currentSongTitle = ""
    var currentSongArtist = ""
    var currentSongGenre = ""
    var currentSongIndex = -1
    var currentSongSpeed = 0
    
    //Settings
    var locationServices = true
    var musicSuggestions = true
    
    func setLocationServices(locS: Bool) {
        locationServices = locS
    }
    func setMusicSuggestions(musS: Bool) {
        musicSuggestions = musS
    }
    
    
}