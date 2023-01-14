//
//  StringExtensions.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 14.12.2022.
//

import Foundation

extension String {
    var isNumeric: Bool {
        !(isEmpty || allSatisfy { $0.isNumber && Int(self)! > 0 })
    }
}
