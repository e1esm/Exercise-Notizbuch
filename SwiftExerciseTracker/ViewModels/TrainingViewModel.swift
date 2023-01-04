//
//  TrainingViewModel.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 18.12.2022.
//

import Foundation
import SQLite3


class TrainingViewModel: ObservableObject{
    private var weeklyActivity: [Int]
    private var chartService: ChartService
    var dbManager: DBManager
    var trainingModel: TrainingModel
    
    init(){
        weeklyActivity = []
        chartService = ChartService()
        self.dbManager = DBManager.instance
        self.trainingModel = TrainingModel()
        trainingModel.currentAmount = dbManager.fetchTodayData(ofSport: trainingModel.type)
        setWeekActivity(ofType: trainingModel.type)
        
    }
    public func getChartServiceInstane() -> ChartService {
        return chartService
    }
    
    
    public func updateCurrentAmount(type: String){
        trainingModel.type = type
        trainingModel.currentAmount = 0
        trainingModel.currentAmount = dbManager.fetchTodayData(ofSport: trainingModel.type)
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
        dbManager.updateDatabase(amountAccomplished: amount, ofType: trainingModel.type, stringOfDate: String(Date().ISO8601Format().prefix(10)))
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
        trainingModel.goalInQuantity = UserDefaults.standard.integer(forKey: "\(trainingModel.type)Goal")
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
    
    public func setNewGoal(amount: Int, type: String){
        UserDefaults.standard.set(amount, forKey: "\(type)Goal")
        self.objectWillChange.send()
    }
    
    public func setWeekActivity(ofType: String){
        weeklyActivity = dbManager.getActivityDuringWeek(ofType: ofType,datesArray: chartService.weekArray)
        self.objectWillChange.send()
        
    }
    
    public func getWeekDatesArray() -> [String]{
        return chartService.weekArray
    }
    public func getWeeklyActivity() -> [Int]{
        return weeklyActivity
    }
    
}
