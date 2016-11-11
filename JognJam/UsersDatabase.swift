//
//  UsersDatabase.swift
//  JognJam
//
//  Created by Angela Dini on 2016-11-10.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import Foundation

class UsersDatabase {
    
    //Possible usernames and passwords
    var usernames = ["angeladini", "emilycross", "mobilecomputing"]
    var passwords = ["ad","ec", "csci5708"]

    //Checks if username and password are correct and match
    func checkIfRight(username: String, password: String)-> Bool {
        for i in 0...3 {
            if usernames[i] == username {
                return passwords[i] == password
            }
        }
        return false
    }
}