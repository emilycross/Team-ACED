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

class musicPlayer: NSObject, AVAudioPlayerDelegate
{
    
    
    //Database of songs, information
    var numSongs = 11
    var titles = ["All In", "Beat Pop", "Death of an Orchid", "Eine Kleine Nachtmusik", "Jingle Bells", "Levels of Greatness", "Sandbox Jingle", "Saturday", "Stay", "Symphony 9 2nd Movement", "Tomorrow"]
    var artists = ["The Red Thread", "Scott Holmes", "Scott Holmes", "Mozart", "Scott Holmes", "Scott Holmes", "Scott Holmes", "Maxwell Powers", "Simple CUT", "Beethoven", "Scott Jacobs"]
    var genres = ["Country", "Pop", "Post-Rock", "Classical", "Pop", "Post-Rock", "Pop", "Pop", "Pop", "Classical", "Country"]
    var speedsOfSongs = [188, 95, 70, 144, 220, 100, 145, 100, 95, 150, 71]
    //Rounds the values in speedsOfSongs to their nearest multiple of ten
    var speedsOfSongsTens = [10*Int(188/10), 10*Int(95/10), 10*Int(70/10), 10*Int(144/10), 10*Int(220/10), 10*Int(100/10), 10*Int(145/10), 10*Int(100/10), 10*Int(95/10), 10*Int(150/10), 10*Int(71/10)]
    var locations = ["Halifax, NS", "Halifax, NS", "Halifax, NS", "Halifax, NS", "Halifax, NS", "Halifax, NS", "Halifax, NS", "Halifax, NS", "Halifax, NS", "Halifax, NS", "Halifax, NS"]
    var songFile = ["allIn", "beatPop", "deathOfAnOrchid", "eineKleineNachtmusik", "jingleBells", "levelsOfGreatness", "sandboxJingle", "saturday", "stay", "symphony92ndMovement", "tomorrow"]
    /* to keep track of most frequently listened to songs */
    var numberOfTimesPlayed = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    
    var currentSongTitle=""
    var currentArtist = ""
    var currentGenre = ""
    var currentSongFile = ""
    var currentIndex = -1
    var currentSongSpeed = 0
    var currentLocation = ""
    var audioPlayer = AVAudioPlayer()
    var songDone = false
    var songPlaying = false
    
    
    var playingPlaylist1 = false
    var playingPlaylist2 = false
    var playingPlaylist3 = false
    var playingPlaylist4 = false
    var playingPlaylist5 = false
    var playlistIndex = -1
    
    /*indices are selected such that they correspond to the order the songs are in the database
    i.e. If someone's most played song is Jingle Bells, mostPlayedIndices[0] is 4 */
    var playingMostPlayed = false
    var mostPlayedIndices = [-1,-1,-1,-1,-1]
    var mostPlayedSongIndex = -1
    
    var randomised = false

    //Records the index of the last played song, and if needed the next song to play
    var prevSongIndex = -1
    var nextSongIndex = -1
    
    
    var suggestionsIndices = [-1,-1,-1,-1,-1]
    var suggestionsTitles = ["","","","",""]
    var suggestionsArtists = ["","","","",""]
    var suggestionsGenres = ["","","","",""]
    var suggestionsSpeed = [0,0,0,0,0]
    var suggestionsLocations = ["","","","",""]
    
    var playlist1Indices = [-1,-1,-1,-1,-1]
    var playlist1Titles = ["","","","",""]
    var playlist1Artists = ["","","","",""]
    var playlist1Genres = ["","","","",""]
    var playlist1Speed = [0,0,0,0,0]
    var playlist1Locations = ["","","","",""]
    
    var playlist2Indices = [-1,-1,-1,-1,-1]
    var playlist2Titles = ["","","","",""]
    var playlist2Artists = ["","","","",""]
    var playlist2Genres = ["","","","",""]
    var playlist2Speed = [0,0,0,0,0]
    var playlist2Locations = ["","","","",""]
    
    var playlist3Indices = [-1,-1,-1,-1,-1]
    var playlist3Titles = ["","","","",""]
    var playlist3Artists = ["","","","",""]
    var playlist3Genres = ["","","","",""]
    var playlist3Speed = [0,0,0,0,0]
    var playlist3Locations = ["","","","",""]
    
    var playlist4Indices = [-1,-1,-1,-1,-1]
    var playlist4Titles = ["","","","",""]
    var playlist4Artists = ["","","","",""]
    var playlist4Genres = ["","","","",""]
    var playlist4Speed = [0,0,0,0,0]
    var playlist4Locations = ["","","","",""]
    
    var playlist5Indices = [-1,-1,-1,-1,-1]
    var playlist5Titles = ["","","","",""]
    var playlist5Artists = ["","","","",""]
    var playlist5Genres = ["","","","",""]
    var playlist5Speed = [0,0,0,0,0]
    var playlist5Locations = ["","","","",""]
    
    func pickSong(n: Int) {
        if(n < titles.count)
        {
            currentSongTitle = titles[n]
            currentArtist = artists[n]
            currentSongFile = songFile[n]
            currentGenre = genres[n]
            currentSongSpeed = speedsOfSongs[n]
            currentLocation = locations[n]
            currentIndex = n
            numberOfTimesPlayed[n] += 1
            
            let songSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(currentSongFile, ofType: "mp3")!)
            do {
                audioPlayer = try AVAudioPlayer(contentsOfURL: songSound)
            } catch {
                print("Cannot find audio")
            }
            audioPlayer.prepareToPlay()
            
        }
    }
    
    //Plays a random song
    func randomPick(){
        pickSong(randomSong()-1)
    }
    
    //Returns a random index in the array of songs
    func randomSong() ->Int {
        var randSelection = currentIndex+1
        while randSelection == currentIndex+1 {
            randSelection = Int(arc4random_uniform(UInt32(numSongs)) + 1)
        }
        return randSelection
    }
    
    //Controls
    func play()
    {
        audioPlayer.play()
        songPlaying = true
    }
    
    func pause()
    {
        if songPlaying == true {
            audioPlayer.stop()
            songPlaying = false
        }
    }
    
    func next() {
        prevSongIndex = currentIndex
        
        if (playingPlaylist1) {
            if (playlistIndex < 4) {
                playlistIndex += 1
                pickSong(playlist1Indices[(playlistIndex)])
            }
            else {
                pickSong(playlist1Indices[0])
                playlistIndex = 0
            }
        }
            
        else if (playingPlaylist2) {
            if (playlistIndex < 4) {
                playlistIndex += 1
                pickSong(playlist2Indices[(playlistIndex)])
            }
            else {
                pickSong(playlist2Indices[0])
                playlistIndex = 0
            }
        }
            
        else if (playingPlaylist3) {
            if (playlistIndex < 4) {
                playlistIndex += 1
                pickSong(playlist3Indices[(playlistIndex)])
            }
            else {
                pickSong(playlist3Indices[0])
                playlistIndex = 0
            }
        }
            
        else if (playingPlaylist4) {
            if (playlistIndex < 4) {
                playlistIndex += 1
                pickSong(playlist4Indices[(playlistIndex)])
            }
            else {
                pickSong(playlist4Indices[0])
                playlistIndex = 0
            }
        }
            
        else if (playingPlaylist5) {
            if (playlistIndex < 4) {
                playlistIndex += 1
                pickSong(playlist5Indices[(playlistIndex)])
            }
            else {
                pickSong(playlist5Indices[0])
                playlistIndex = 0
            }
        }
        
            
        else if randomised == true {
            playingPlaylist1 = false
            playingPlaylist2 = false
            playingPlaylist3 = false
            playingPlaylist4 = false
            playingPlaylist5 = false
            randomPick()

        }
            
        else if playingMostPlayed == true {
            if (mostPlayedSongIndex < 4) {
                mostPlayedSongIndex += 1
                pickSong(mostPlayedIndices[mostPlayedSongIndex])
                
            }
            else {
                pickSong(mostPlayedIndices[0])
                mostPlayedSongIndex = 0
            }
            
        }
            
        else if nextSongIndex == -1 {
            randomPick()
        }
            
        else {
            pickSong(nextSongIndex)
            nextSongIndex = -1
        }

        
    }
    
    func prev() {
        nextSongIndex = currentIndex
        if prevSongIndex == -1 {
            randomPick()
        }
        else {
            pickSong(prevSongIndex)
            prevSongIndex = -1
        }
        
    }
    func suggestionPressed() {
        pause()
        prevSongIndex = currentIndex
        pickSong(suggestionsIndices[0])
        nextSongIndex = -1
    }
    
    //Methods for suggestions by different attributes
    func getSuggestionsByArtist(artist: String)
    {
        reset()
        for i in 0...4 {
            for j in 0...(artists.count-1) {
                if artists[j] == artist && !suggestionsIndices.contains(j) && currentIndex != j {
                    suggestionsArtists[i] = artists[j]
                    suggestionsTitles[i] = titles[j]
                    suggestionsGenres[i] = genres[j]
                    suggestionsLocations[i] = locations[j]
                    suggestionsIndices[i] = j
                    suggestionsSpeed[i] = speedsOfSongs[j]
                    break
                }
            }
        }
    }
    func getSuggestionByGenre(genre: String)
    {
        reset()
        for i in 0...4 {
            for j in 0...(genres.count-1) {
                if genres[j] == genre && !suggestionsIndices.contains(j) && currentIndex != j {
                    suggestionsArtists[i] = artists[j]
                    suggestionsTitles[i] = titles[j]
                    suggestionsGenres[i] = genres[j]
                    suggestionsIndices[i] = j
                    suggestionsSpeed[i] = speedsOfSongs[j]
                    suggestionsLocations[i] = locations[j]
                    break
                }
            }
        }

    }
    func getSuggestionBySpeed(speed: Int)
    {
        reset()
        for i in 0...4 {
            for j in 0...(speedsOfSongs.count-1) {
                if speedsOfSongsTens[j] == 10*Int(speed/10) && !suggestionsIndices.contains(j) && currentIndex != j {
                    suggestionsArtists[i] = artists[j]
                    suggestionsTitles[i] = titles[j]
                    suggestionsGenres[i] = genres[j]
                    suggestionsIndices[i] = j
                    suggestionsSpeed[i] = speedsOfSongs[j]
                    suggestionsLocations[i] = locations[j]
                    break
                }
            }
        }
    }
    func getSuggestionByLocation(location: String)
    {
        reset()
        for i in 0...4 {
            for j in 0...(locations.count-1) {
                if locations[j] == location && !suggestionsIndices.contains(j) && currentIndex != j {
                    suggestionsArtists[i] = artists[j]
                    suggestionsTitles[i] = titles[j]
                    suggestionsGenres[i] = genres[j]
                    suggestionsIndices[i] = j
                    suggestionsSpeed[i] = speedsOfSongs[j]
                    suggestionsLocations[i] = locations[j]
                    break
                }
            }
        }

    }
    func reset() {
        suggestionsIndices = [-1,-1,-1,-1,-1]
        suggestionsTitles = ["","","","",""]
        suggestionsArtists = ["","","","",""]
        suggestionsGenres = ["","","","",""]
        suggestionsSpeed = [0,0,0,0,0]
        suggestionsLocations = ["","","","",""]
    }

    
    
    func playSelectedPlaylist(playlist: Int) {
        /* automatically fill first playlist with first 5 songs so we have something to show in demo */
        reset()
        if (playlist == 0) {
            for i in 0...4 {
                playlist1Artists[i] = artists[i]
                playlist1Titles[i] = titles[i]
                playlist1Genres[i] = genres[i]
                playlist1Indices[i] = i
                playlist1Speed[i] = speedsOfSongs[i]
                playlist1Locations[i] = locations[i]
            }
        }
    }
    
 
    
    
    //The song stopped so play the next one, have to change
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        //Play another random song
        let randSelection = Int(arc4random_uniform(UInt32(numSongs)) + 1)
        pickSong(randSelection-1)
        play()
    }

}