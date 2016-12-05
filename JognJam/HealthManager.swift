//
//  HealthManager.swift
//  JognJam
//
//  Created by Team-ACED on 2016-12-05.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import Foundation
import HealthKit

class HealthManager {
    let healthKitStore = HKHealthStore()
    
    func authorizeHealthKit(completion: ((success:Bool, error: NSError!) -> Void)!) {
        let healthKitTypesToRead = Set(arrayLiteral: [])
        let healthKitTypesToWrite = Set(arrayLiteral: [])
        if !HKHealthStore.isHealthDataAvailable() {
            let error = NSError(domain: "com.aced.JognJam", code: 2, userInfo: [NSLocalizedDescriptionKey: "HealthKit is not available."])
            if completion != nil {
                completion(success: false, error: error)
            }
            return
        }
        
        healthKitStore.requestAuthorizationToShareTypes(healthKitTypesToWrite, readTypes: healthKitTypesToRead, completion: {(sucess, error) -> Void in
            if completion != nil
            {
                completion(success:success, error:error)
            })
    }
}