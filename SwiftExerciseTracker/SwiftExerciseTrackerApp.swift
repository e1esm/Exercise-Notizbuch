//
//  SwiftExerciseTrackerApp.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 14.12.2022.
//

import SwiftUI

@main
struct SwiftExerciseTrackerApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var userViewModel = UserViewModel()
    @StateObject private var trainingViewModel = TrainingViewModel()
    
    var body: some Scene {
        WindowGroup{
                ContentView().environmentObject(userViewModel).environmentObject(trainingViewModel)
            }
        }
}
