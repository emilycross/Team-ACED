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
    var titles = ["Quote"] // list of songs, can change later, 3/4 for demo? using the one in the TA's github
    var artists = ["Forrest Gump"] //list of artists, can change later, 3/4 for demo? using the one in the TA's github
    var genres = ["Soundtrack"]
    var speedsOfSongs = [0] //change
    var locations = [""]
    var songFile = ["movie_quote"] //list of song files associated with song and artist
    var currentSongTitle=""
    var currentArtist = ""
    var currentGenre = ""
    var currentSongFile = ""
    var currentIndex = -1
    var audioPlayer = AVAudioPlayer()
    
    var suggestionsUsed = []
    var suggestionsTitles = []
    var suggestionsArtists = []
    
    func pickSong(n: Int) {
        if(n < titles.count)
        {
            currentSongTitle = titles[n]
            currentArtist = artists[n]
            currentSongFile = songFile[n]
            currentGenre = genres[n]
            currentIndex = n
            let songSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(currentSongFile, ofType: "mp3")!)
            do {
                audioPlayer = try AVAudioPlayer(contentsOfURL: songSound)
            } catch {
                print("Cannot find audio")
            }
            audioPlayer.prepareToPlay()
        }
    }
    func play()
    {
        audioPlayer.play()
    }
    func pause()
    {
        audioPlayer.stop()
    }
    func getSuggestionByArtist(artist: String) -> Int
    {
        var i = -1
        for a in artists {
            i += 1
            if a == artist { //&& !suggestionsUsed.containsObject(i) {
                suggestionsUsed = suggestionsUsed.arrayByAddingObject(i)
                return i
            }
        }
        return -1 //not found
    }
    func getSuggestionByGenre(genre: String) -> Int
    {
        var i = -1
        for g in genres {
            i += 1
            if g == genre {//&& !suggestionsUsed.containsObject(i) {
                suggestionsUsed = suggestionsUsed.arrayByAddingObject(i)
                suggestionsTitles = suggestionsTitles.arrayByAddingObject(titles[i])
                suggestionsArtists = suggestionsArtists.arrayByAddingObject(artists[i])
                return i
            }
        }
        return -1 //not found
    }
    func getSuggestionBySpeed(speed: Int) -> Int
    {
        var i = -1
        for s in speedsOfSongs {
            i += 1
            if s == speed {//&& !suggestionsUsed.containsObject(i) {
                suggestionsUsed = suggestionsUsed.arrayByAddingObject(i)
                suggestionsTitles = suggestionsTitles.arrayByAddingObject(titles[i])
                suggestionsArtists = suggestionsArtists.arrayByAddingObject(artists[i])
                return i
            }
        }
        return -1 //not found
    }
    func getSuggestionByLocation(location: String) -> Int
    {
        var i = -1
        for l in locations {
            i += 1
            if l == location {//&& !suggestionsUsed.containsObject(i) {
                suggestionsUsed = suggestionsUsed.arrayByAddingObject(i)
                suggestionsTitles = suggestionsTitles.arrayByAddingObject(titles[i])
                suggestionsArtists = suggestionsArtists.arrayByAddingObject(artists[i])
                return i
            }
        }
        return -1 //not found
    }
}