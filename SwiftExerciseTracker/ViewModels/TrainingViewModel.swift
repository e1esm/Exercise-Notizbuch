//
//  TrainingViewModel.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 18.12.2022.
//

import Foundation
import SQLite3


class TrainingViewModel: ObservableObject{
    
    var dbManager: DBManager
    var trainingModel: TrainingModel
    
    init(){
        self.dbManager = DBManager.instance
        self.trainingModel = TrainingModel()
    }
    
    
    public func updateCurrentAmount(){
        trainingModel.currentAmount = 0
        self.objectWillChange.send()
    }
    
    
    public func getCurrentAmount() -> Int {
        return trainingModel.currentAmount;
     }

    public func setGoal(newGoal: Int) {
        trainingModel.goalInQuantity = newGoal;
        self.objectWillChange.send()
     }


    public func increaseBy(amount: Int) {
        trainingModel.currentAmount += amount;
        print("\(trainingModel.currentAmount) in TrainingModel")
        self.objectWillChange.send()
     }

     public func setProgresses(amount: Int) {
         trainingModel.currentAmount = amount;
         if (amount < trainingModel.goalInQuantity) {
             trainingModel.currentAmountForProgressBar = amount;
       } else {
           trainingModel.currentAmountForProgressBar = trainingModel.goalInQuantity;
       }
         self.objectWillChange.send()
     }
    
    public func getGoalInQuantity()->Int{
        return trainingModel.goalInQuantity
    }
    
    public func getStepsGoal()-> Int{
        return trainingModel.goalInSteps
    }
    public func setStepsGoal(goal: Int){
        trainingModel.goalInSteps = goal
    }
    public func getCurrentSteps()-> Int{
        return trainingModel.currentSteps
    }
    public func setCurrentSteps(steps: Int){
        trainingModel.currentSteps = steps
        self.objectWillChange.send()
    }

    
}
