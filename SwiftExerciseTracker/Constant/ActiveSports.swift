//
//  ActiveSports.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 02.01.2023.
//

import Foundation

class SportRepository{
    var userDefaults = UserDefaults.standard
    var activeSport: [String: Bool] = [
        "Push-ups": true,
        "Sit-ups": true,
        "Abs": true,
        "Lunges": true,
        "Pull-ups": true,
        "Burpee": true
        ]
    init(){
        if(userDefaults.object(forKey: "activeSports") == nil){
            userDefaults.set(activeSport, forKey: "activeSports")
        }else{
            activeSport = userDefaults.object(forKey: "activeSports") as! [String : Bool]
        }

    }
    
    func changeState(key: String, state: Bool){
        activeSport[key] = state
        userDefaults.set(activeSport, forKey: "activeSports")
    }
    
    func updateState(){
        
    }
}

