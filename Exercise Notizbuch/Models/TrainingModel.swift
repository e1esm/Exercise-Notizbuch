//
//  TrainingModel.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 14.12.2022.
//

import Foundation

class TrainingModel {
    var currentAmount: Int
    var currentAmountForProgressBar: Int
    var goalInQuantity: Int
    var type: String
    var goalInSteps: Int {
        UserDefaults.standard.integer(forKey: "StepsGoal")
    }

    var currentSteps: Int

    init(currentAmount: Int, currentAmountForProgressBar: Int, goalInQuantity: Int, type: String = "Sit-ups", goalInSteps _: Int, currentSteps: Int) {
        self.currentAmount = currentAmount
        self.currentAmountForProgressBar = currentAmountForProgressBar
        self.goalInQuantity = goalInQuantity
        self.type = type
        // self.goalInSteps = goalInSteps
        self.currentSteps = currentSteps
    }

    init() {
        currentAmount = 0
        currentAmountForProgressBar = 0
        goalInQuantity = 100
        // goalInSteps = 1000
        if (UserDefaults.standard.string(forKey: "lastSet")) == nil {
            UserDefaults.standard.set(1000, forKey: "StepsGoal")
            type = "Sit-ups"
            let sportRepoKeys = UserDefaults.standard.object(forKey: "activeSports") as! [String: Bool]
            for sport in Array(sportRepoKeys.keys) {
                UserDefaults.standard.set(100, forKey: "\(sport)Goal")
            }
            UserDefaults.standard.set(type, forKey: "lastSet")
        } else {
            type = UserDefaults.standard.string(forKey: "lastSet")!
        }
        currentSteps = 0
    }
}
