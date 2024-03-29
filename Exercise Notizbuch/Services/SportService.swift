//
//  SportService.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 02.01.2023.
//

import Foundation

class SportService: ObservableObject {
    var userDefaults = UserDefaults.standard
    var sportRepository = SportRepository()
    var activeSport: [String]

    init() {
        activeSport = []
        userDefaults.set(sportRepository.activeSport, forKey: "activeSports")
        updateActiveSportArray()
    }

    func updateActiveSportArray() {
        activeSport.removeAll()
        let activeDictionary: [String: Bool] = userDefaults.object(forKey: "activeSports") as! [String: Bool]
        for (key, value) in activeDictionary {
            if value == true {
                activeSport.append(key)
            }
        }
    }

    func changeStateOfSportArray(key: String, state: Bool) {
        sportRepository.activeSport[key] = state
        userDefaults.set(sportRepository.activeSport, forKey: "activeSports")
        updateActiveSportArray()
        objectWillChange.send()
    }
}
