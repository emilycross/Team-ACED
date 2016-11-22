//
//  SpecificPlaylistViewController.swift
//  JognJam
//
//  Created by Team-ACED on 2016-11-17.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import UIKit

class SpecificPlaylistViewController: UIViewController {

    var user = userProfile()
    var player = musicPlayer()
    
    var playlistNumber = 0
    
    @IBOutlet weak var playlistNumberLabel: UILabel!
    
    @IBOutlet weak var song1: UIButton!
    @IBOutlet weak var song2: UIButton!
    @IBOutlet weak var song3: UIButton!
    @IBOutlet weak var song4: UIButton!
    @IBOutlet weak var song5: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playlistNumberLabel.text = "Playlist " + String(playlistNumber)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
