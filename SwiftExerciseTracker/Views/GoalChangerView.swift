//
//  GoalChangerView.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 02.01.2023.
//

import Foundation
import SwiftUI


struct GoalChangerView: View{
    @Environment(\.dismiss) var dismiss
    var body: some View{
        Text("Hello world")
        Button("Press to dismiss"){
            dismiss()
        }
    }
}
