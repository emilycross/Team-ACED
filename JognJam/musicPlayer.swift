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
    var currentSongTitle=""
    var currentArtist = ""
    var currentGenre = ""
    var currentSongFile = ""
    var currentIndex = -1
    var currentSongSpeed = 0
    var audioPlayer = AVAudioPlayer()
    var songDone = false
    var songPlaying = false
    
    var suggestionsIndices = [-1,-1,-1,-1,-1]
    var suggestionsTitles = ["","","","",""]
    var suggestionsArtists = ["","","","",""]
    var suggestionsGenres = ["","","","",""]
    var suggestionsSpeed = [0,0,0,0,0]
    
    var playlistIndices = [-1,-1,-1,-1,-1]
    var playlistTitles = ["","","","",""]
    var playlistArtists = ["","","","",""]
    var playlistGenres = ["","","","",""]
    var playlistSpeed = [0,0,0,0,0]
    
    func pickSong(n: Int) {
        if(n < titles.count)
        {
            
            currentSongTitle = titles[n]
            currentArtist = artists[n]
            currentSongFile = songFile[n]
            currentGenre = genres[n]
            currentSongSpeed = speedsOfSongs[n]
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
    func randomPick()-> Int{
        var randSelection = currentIndex+1
        while randSelection == currentIndex+1 {
            randSelection = Int(arc4random_uniform(UInt32(numSongs)) + 1)
        }
        pickSong(randSelection-1)
        return randSelection
    }
    func play()
    {
        audioPlayer.play()
        songPlaying = true
    }
    func pause()
    {
        audioPlayer.stop()
        songPlaying = false
    }
    func getSuggestionsByArtist(artist: String)
    {
        reset()
        for i in 0...4 {
            for j in 0...(artists.count-1) {
                if artists[j] == artist && !suggestionsIndices.contains(j) && currentIndex != j {
                    suggestionsArtists[i] = artists[j]
                    suggestionsTitles[i] = titles[j]
                    suggestionsGenres[i] = genres[j]
                    suggestionsIndices[i] = j
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
                if speedsOfSongs[j] == speed && !suggestionsIndices.contains(j) && currentIndex != j {
                    suggestionsArtists[i] = artists[j]
                    suggestionsTitles[i] = titles[j]
                    suggestionsGenres[i] = genres[j]
                    suggestionsIndices[i] = j
                    suggestionsSpeed[i] = speedsOfSongs[j]
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
                    break
                }
            }
        }

    }
    
    
    /* right now the playlist is just going to be Forrest Gump over and over again... */
    func playSelectedPlaylist(playlist: Int) {
        for i in 0...4 {
            /* this will change when playlists are fully implemented */
            for j in 0...(artists.count-1) {
                playlistArtists[i] = artists[j]
                playlistTitles[i] = titles[j]
                playlistGenres[i] = genres[j]
                playlistIndices[i] = j
                playlistSpeed[i] = speedsOfSongs[j]
                break;
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
    
    func reset() {
        suggestionsIndices = [-1,-1,-1,-1,-1]
        suggestionsTitles = ["","","","",""]
        suggestionsArtists = ["","","","",""]
        suggestionsGenres = ["","","","",""]
        suggestionsSpeed = [0,0,0,0,0]
    }

}