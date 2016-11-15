//
//  userProfile.swift
//  JognJam
//
//  Created by Angela Dini on 2016-11-12.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import Foundation

//class that holds information for each user's profile
class userProfile
{
    //var routes
    //var playlists
    var picture = "" //name of picture used for profile picture
    var numberSteps = 0
    var currentSpeed = 0
    var highestSpeed = 1
    
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