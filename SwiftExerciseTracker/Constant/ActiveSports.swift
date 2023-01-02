//
//  ActiveSports.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 02.01.2023.
//

import Foundation

class SportRepository{
    var userDefaults = UserDefaults.standard
    static var activeSport: [String: Bool] = [
        "Push-ups": true,
        "Sit-ups": true,
        "Abs": true,
        "Lunges": true,
        "Pull-Ups": true,
        "Burpee": true
        ]
    
    init(){
        userDefaults.set(SportRepository.activeSport, forKey: "activeSport")
    }
    
    func changeState(key: String, state: Bool){
        SportRepository.activeSport[key] = state
        userDefaults.set(SportRepository.activeSport, forKey: "activeSport")
    }
    
    func updateState(){
        
    }
}

