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
    //Database of songs
    var titles = ["Quote"] // list of songs, can change later, 3/4 for demo? using the one in the TA's github
    var artists = ["Forrest Gump"] //list of artists, can change later, 3/4 for demo? using the one in the TA's github
    var genres = ["Soundtrack"]
    var speedsOfSongs = [286] //change
    var locations = [""]
    var songFile = ["movie_quote"] //list of song files associated with song and artist
    var currentSongTitle=""
    var currentArtist = ""
    var currentGenre = ""
    var currentSongFile = ""
    var currentIndex = -1
    var currentSongSpeed = 0
    var audioPlayer = AVAudioPlayer()
    var songDone = false
    
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
    func play()
    {
        audioPlayer.play()
    }
    func pause()
    {
        audioPlayer.stop()
    }
    func getSuggestionsByArtist(artist: String)
    {
        for i in 0...4 {
            for j in 0...(artists.count-1) {
                if artists[j] == artist {
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
        for i in 0...4 {
            for j in 0...(genres.count-1) {
                if genres[j] == genre {
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
        for i in 0...4 {
            for j in 0...(speedsOfSongs.count-1) {
                if speedsOfSongs[j] == speed {
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
        for i in 0...4 {
            for j in 0...(locations.count-1) {
                if locations[j] == location {
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
        pickSong(0) //change to next one
        play()
    }
}