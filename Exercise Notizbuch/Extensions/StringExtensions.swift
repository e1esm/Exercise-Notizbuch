//
//  StringExtensions.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 14.12.2022.
//

import Foundation

extension String {
    var isNumeric: Bool {
        return !(self.isEmpty || self.allSatisfy { $0.isNumber  && Int(self)! > 0})
    }
}

