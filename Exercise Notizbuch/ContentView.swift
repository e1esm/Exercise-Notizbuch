//
//  ContentView.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 14.12.2022.
//

import CoreData
import SwiftUI

import CoreMotion
import UIKit
struct ContentView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var trainingViewModel: TrainingViewModel
    @EnvironmentObject var sportService: SportService

    var body: some View {
        TabViewScreen()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserViewModel()).environmentObject(TrainingViewModel())
            .environmentObject(SportService())

        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
            .previewDisplayName("iPhone 14 Pro Max")
            .environmentObject(UserViewModel())
            .environmentObject(TrainingViewModel())
            .environmentObject(SportService())
    }
}
