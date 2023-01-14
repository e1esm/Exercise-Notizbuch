//
//  InputAlert.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 14.12.2022.
//

import Foundation
import SwiftUI

struct InvalidInputAlertView: View {
    var body: some View {
        Alert(
            title: Text("Invalid input"),
            message: Text("You entered invalid number, try another one."),
            dismissButton: .default(Text("Got it!"))
        )
    }
}
