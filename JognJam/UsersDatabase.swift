//
//  UsersDatabase.swift
//  JognJam
//
//  Created by Team-ACED on 2016-11-10.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import Foundation

class UsersDatabase {
    
    /* Usernames and passwords */
    var usernames = ["angeladini", "emilycross", "mobilecomputing"]
    var passwords = ["ad","ec", "csci5708"]
    var profiles = [userProfile(), userProfile(), userProfile()]
    var players = [musicPlayer(), musicPlayer(), musicPlayer()]

    /* Checks if username and password are correct and match */
    func checkIfRight(username: String, password: String)-> Bool {
        for i in 0...2 {
            if usernames[i] == username {
                return passwords[i] == password
            }
        }
        return false
    }
}