//
//  TrainingModel.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 14.12.2022.
//

import Foundation

class TrainingModel{
    var currentAmount: Int
    var currentAmountForProgressBar: Int
    var goalInQuantity: Int
    var type: String
    var goalInSteps: Int
    var currentSteps: Int
    
    init(currentAmount: Int, currentAmountForProgressBar: Int, goalInQuantity: Int, type: String = "Sit-ups", goalInSteps: Int, currentSteps: Int) {
        self.currentAmount = currentAmount
        self.currentAmountForProgressBar = currentAmountForProgressBar
        self.goalInQuantity = goalInQuantity
        self.type = type
        self.goalInSteps = goalInSteps
        self.currentSteps = currentSteps
    }
    
    init(){
        currentAmount = 0;
        currentAmountForProgressBar = 0
        goalInQuantity = 100
        goalInSteps = 1000
        type = "Sit-ups"
        self.currentSteps = 0
    }
}
