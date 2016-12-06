//
//  userProfile.swift
//  JognJam
//
//  Created by Team-ACED on 2016-11-12.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

/*Holds information for each user's profile */
class userProfile {

    var username = ""
    /* Default profile image is the logo */
    var picture = UIImage(named: "Logo2_Square.png") //picture used for profile picture
    
    /* Track number of steps */
    var numberSteps = 0
    
    var start = true
    
    /* Information for suggestions */
    var currentLocation = ""
    var currentSongTitle = ""
    var currentSongArtist = ""
    var currentSongGenre = ""
    
    /* Current song information */
    var currentSongIndex = -1
    var currentSongSpeed = 0

    /* Keeps track of how many playlists currently exist (1 is created manually */
    var playlists = [true, false, false, false, false]
    /* Keeps track of route locations */
    var routeLocations = [[CLLocation](),[CLLocation](), [CLLocation](), [CLLocation](), [CLLocation]()]
    
    var routeStarted = false
    
    /* Settings */
    var locationServices = true
    var musicSuggestions = true
    
    /* Allow user to manipulate settings */
    func setLocationServices(locS: Bool) {
        locationServices = locS
    }
    
    func setMusicSuggestions(musS: Bool) {
        musicSuggestions = musS
    }
    
    
}