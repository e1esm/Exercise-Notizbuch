//
//  SportDTO.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 04.01.2023.
//

import Foundation

class SportDTO: Identifiable{
    let id = UUID()
    private var sportType: String
    private var currentQuantity: Int
    private var currentDate: String
    
    init(){
        currentDate = ""
        sportType = ""
        currentQuantity = 0
    }
    init(sportType: String, currentQuantity: Int, currentDate: String){
        self.currentQuantity = currentQuantity
        self.sportType = sportType
        self.currentDate = currentDate
    }
    
    public func getSportType() -> String{
        return sportType
    }
    public func getCurrentDate() -> String{
        print(currentDate, "getCurrentDate")
        return currentDate
    }
    public func getCurrentQuantity() -> Int{
        return currentQuantity
    }
}
