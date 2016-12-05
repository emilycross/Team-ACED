//
//  CreatePlaylistViewController.swift
//  JognJam
//
//  Created by Emily Cross on 2016-12-05.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import UIKit

class CreatePlaylistViewController: UIViewController {

    var user = userProfile()
    var player = musicPlayer()
    
    var numPicked = 0
    var songsPicked = [12, 12, 12, 12, 12]
    
    var selected = UIColor(red: 127/255, green: 7/255, blue: 153/255, alpha: 1.0)
    var createdPlaylist = false
    
    @IBOutlet weak var song1: UIButton!
    @IBOutlet weak var song2: UIButton!
    @IBOutlet weak var song3: UIButton!
    @IBOutlet weak var song4: UIButton!
    @IBOutlet weak var song5: UIButton!
    @IBOutlet weak var song6: UIButton!
    @IBOutlet weak var song7: UIButton!
    @IBOutlet weak var song8: UIButton!
    @IBOutlet weak var song9: UIButton!
    @IBOutlet weak var song10: UIButton!
    @IBOutlet weak var song11: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveSongs()
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func retrieveSongs() {
        displaySong(song1, num: 0)
        displaySong(song2, num: 1)
        displaySong(song3, num: 2)
        displaySong(song4, num: 3)
        displaySong(song5, num: 4)
        displaySong(song6, num: 5)
        displaySong(song7, num: 6)
        displaySong(song8, num: 7)
        displaySong(song9, num: 8)
        displaySong(song10, num: 9)
        displaySong(song11, num: 10)
    }
    
    func displaySong(button: UIButton, num: Int)
    {
        if player.titles[num] == "" {
            button.setTitle("No song available", forState: UIControlState.Normal)
            button.enabled = false
        }
        else {
            button.setTitle((player.titles[num]+" - "+player.artists[num]), forState: UIControlState.Normal)
        }
        
        
    }
    
    
    @IBAction func addSong1(sender: AnyObject) {
        if (numPicked < 5) {
            for i in 0...4 {
                if(songsPicked[i] == 12) {
                    songsPicked[i] = 0
                    song1.setTitleColor(selected, forState: UIControlState.Normal)
                    numPicked += 1
                    checkSize()
                    break;
                }
                
            }
            
        }
        
    }
    
    @IBAction func addSong2(sender: AnyObject) {
        if (numPicked < 5) {
            for i in 0...4 {
                if(songsPicked[i] == 12) {
                    songsPicked[i] = 1
                    song2.setTitleColor(selected, forState: UIControlState.Normal)
                    numPicked += 1
                    checkSize()
                    break;
                }
                
            }
            
        }
        
    }
    
    
    @IBAction func addSong3(sender: AnyObject) {
        if (numPicked < 5) {
            for i in 0...4 {
                if(songsPicked[i] == 12) {
                    songsPicked[i] = 2
                    song3.setTitleColor(selected, forState: UIControlState.Normal)
                    numPicked += 1
                    checkSize()
                    break;
                }
                
            }
            
        }

    }
    
    @IBAction func addSong4(sender: AnyObject) {
        if (numPicked < 5) {
            for i in 0...4 {
                if(songsPicked[i] == 12) {
                    songsPicked[i] = 3
                    song4.setTitleColor(selected, forState: UIControlState.Normal)
                    numPicked += 1
                    checkSize()
                    break;
                }
                
            }
            
        }

    }
    
    @IBAction func addSong5(sender: AnyObject) {
        if (numPicked < 5) {
            for i in 0...4 {
                if(songsPicked[i] == 12) {
                    songsPicked[i] = 4
                    song5.setTitleColor(selected, forState: UIControlState.Normal)
                    numPicked += 1
                    checkSize()
                    break;
                }
                
            }
            
        }
    }
    
    @IBAction func addSong6(sender: AnyObject) {
        if (numPicked < 5) {
            for i in 0...4 {
                if(songsPicked[i] == 12) {
                    songsPicked[i] = 5
                    song6.setTitleColor(selected, forState: UIControlState.Normal)
                    numPicked += 1
                    checkSize()
                    break;
                }
                
            }
            
        }

    }
    
    @IBAction func addSong7(sender: AnyObject) {
        if (numPicked < 5) {
            for i in 0...4 {
                if(songsPicked[i] == 12) {
                    songsPicked[i] = 6
                    song7.setTitleColor(selected, forState: UIControlState.Normal)
                    numPicked += 1
                    checkSize()
                    break;
                }
                
            }
            
        }

    }
    
    @IBAction func addSong8(sender: AnyObject) {
        if (numPicked < 5) {
            for i in 0...4 {
                if(songsPicked[i] == 12) {
                    songsPicked[i] = 7
                    song8.setTitleColor(selected, forState: UIControlState.Normal)
                    numPicked += 1
                    checkSize()
                    break;
                }
                
            }
            
        }

    }
    
    @IBAction func addSong9(sender: AnyObject) {
        if (numPicked < 5) {
            for i in 0...4 {
                if(songsPicked[i] == 12) {
                    songsPicked[i] = 8
                    song9.setTitleColor(selected, forState: UIControlState.Normal)
                    numPicked += 1
                    checkSize()
                    break;
                }
                
            }
         
        }
    }
    
    @IBAction func addSong10(sender: AnyObject) {
        if (numPicked < 5) {
            for i in 0...4 {
                if(songsPicked[i] == 12) {
                    songsPicked[i] = 9
                    song10.setTitleColor(selected, forState: UIControlState.Normal)
                    numPicked += 1
                    checkSize()
                    break;
                }
                
            }
            
        }

    }
    
    
    @IBAction func addSong11(sender: AnyObject) {
        if (numPicked < 5) {
            for i in 0...4 {
                if(songsPicked[i] == 12) {
                    songsPicked[i] = 10
                    song11.setTitleColor(selected, forState: UIControlState.Normal)
                    numPicked += 1
                    checkSize()
                    break;
                }
                
            }
            
        }
    }
    
    func checkSize() {
        if (numPicked == 5) {
            createPlaylist()
        }
    }
    
    func createPlaylist() {
        for i in 0...4 {
            if user.playlists[i] == false && createdPlaylist == false {
                if i == 0 {
                    for i in 0 ... 4 {
                        player.playlist1Artists[i] = player.artists[songsPicked[i]]
                        player.playlist1Titles[i] = player.titles[songsPicked[i]]
                        player.playlist1Genres[i] = player.genres[songsPicked[i]]
                        player.playlist1Indices[i] = i
                        player.playlist1Speed[i] = player.speedsOfSongs[songsPicked[i]]
                        player.playlist1Locations[i] = player.locations[songsPicked[i]]
                    }
                }
                if i == 1 {
                    for i in 0 ... 4 {
                        player.playlist2Artists[i] = player.artists[songsPicked[i]]
                        player.playlist2Titles[i] = player.titles[songsPicked[i]]
                        player.playlist2Genres[i] = player.genres[songsPicked[i]]
                        player.playlist2Indices[i] = i
                        player.playlist2Speed[i] = player.speedsOfSongs[songsPicked[i]]
                        player.playlist2Locations[i] = player.locations[songsPicked[i]]
                    }
                }
                
                if i == 2 {
                    for i in 0 ... 4 {
                        player.playlist3Artists[i] = player.artists[songsPicked[i]]
                        player.playlist3Titles[i] = player.titles[songsPicked[i]]
                        player.playlist3Genres[i] = player.genres[songsPicked[i]]
                        player.playlist3Indices[i] = i
                        player.playlist3Speed[i] = player.speedsOfSongs[songsPicked[i]]
                        player.playlist3Locations[i] = player.locations[songsPicked[i]]
                    }
                }
                
                if i == 3 {
                    for i in 0 ... 4 {
                        player.playlist4Artists[i] = player.artists[songsPicked[i]]
                        player.playlist4Titles[i] = player.titles[songsPicked[i]]
                        player.playlist4Genres[i] = player.genres[songsPicked[i]]
                        player.playlist4Indices[i] = i
                        player.playlist4Speed[i] = player.speedsOfSongs[songsPicked[i]]
                        player.playlist4Locations[i] = player.locations[songsPicked[i]]
                    }
                }
                
                if i == 4 {
                    for i in 0 ... 4 {
                        player.playlist5Artists[i] = player.artists[songsPicked[i]]
                        player.playlist5Titles[i] = player.titles[songsPicked[i]]
                        player.playlist5Genres[i] = player.genres[songsPicked[i]]
                        player.playlist5Indices[i] = i
                        player.playlist5Speed[i] = player.speedsOfSongs[songsPicked[i]]
                        player.playlist5Locations[i] = player.locations[songsPicked[i]]
                    }
                }
                
                
                user.playlists[i] = true
                createdPlaylist = true
            }
            
        }
        
        performSegueWithIdentifier("createPlaylistToPlaylist", sender: self)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "createPlaylistToPlaylist" {
            let destinationVC = segue.destinationViewController as? PlaylistViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            
        }
        
        else if segue.identifier == "createPlaylistToLogin" {
            self.player.pause()
        }
    }

}
