//
//  DateExtension.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 18.12.2022.
//

import Foundation


extension Date{
    func distance(from date: Date, only component: Calendar.Component, calendar: Calendar = .current) -> Int {
            let days1 = calendar.component(component, from: self)
            let days2 = calendar.component(component, from: date)
            return days1 - days2
        }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var startOfDay: Date {
          return Calendar.current.startOfDay(for: self)
      }
}
