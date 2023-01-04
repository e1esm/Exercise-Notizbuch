//
//  ChartService.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 04.01.2023.
//

import Foundation

class ChartService{
    var weekArray: [String]
    
    init(){
        weekArray = []
        weekArray = convertDateArrayToStringArray()
    }
    
    func convertDateArrayToStringArray() -> [String]{
        var noon: Date = Date().noon
        var dateArray: [String] = []
        for i in -6...0 {
            dateArray.append(String(Calendar.current.date(byAdding: .day, value: i, to: noon)!.ISO8601Format().prefix(10)))
        }
        return dateArray
    }
}
