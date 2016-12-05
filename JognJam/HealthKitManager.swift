//
//  HealthKitManager.swift
//  JognJam
//
//  Created by Angela Dini on 2016-12-05.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import Foundation
import HealthKit

class HealthKitManager {
    let healthKitStore = HKHealthStore()
    var stepsTaken = 0.0
    
    init() {
        checkAuthorization()
    }
    func checkAuthorization() -> Bool {
        var isEnabled = true
        
        if HKHealthStore.isHealthDataAvailable()
        {
            let steps = NSSet(object: HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierStepCount)!)
            healthKitStore.requestAuthorizationToShareTypes(nil, readTypes: steps as? Set<HKObjectType>) { (success, error) -> Void in
                isEnabled = success
            }
        }
        else {
            isEnabled = false
        }
        return isEnabled
    }
    
    func getNumSteps(completion: (Double, NSError?) -> () ){
        let type = HKSampleType.quantityTypeForIdentifier(HKQuantityTypeIdentifierStepCount) // The type of data we are requesting
        
        
        let date = NSDate()
        let cal = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        let newDate = cal.startOfDayForDate(date)
        let predicate = HKQuery.predicateForSamplesWithStartDate(newDate, endDate: NSDate(), options: .None) // Our search predicate which will fetch all steps taken today
        var stepsTaken = 0.0
        
        // The actual HealthKit Query which will fetch all of the steps and add them up for us.
        let query = HKSampleQuery(sampleType: type!, predicate: predicate, limit: 0, sortDescriptors: nil) { query, results, error in
            
            if results?.count > 0
            {
                for result in results as! [HKQuantitySample]
                {
                    stepsTaken += result.quantity.doubleValueForUnit(HKUnit.countUnit())
                }
            }
            
            completion(stepsTaken, error)
        }
        
        healthKitStore.executeQuery(query)
    }
    func getSteps() -> Double {
        return stepsTaken
    }

}