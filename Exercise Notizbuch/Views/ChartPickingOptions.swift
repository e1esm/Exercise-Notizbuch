//
//  ChartPickingOptions.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 04.01.2023.
//

import Foundation
import SwiftUI

struct ChartPickingView: View {
    @EnvironmentObject var trainingViewModel: TrainingViewModel
    @EnvironmentObject var sportService: SportService
    @State private var currentSport = "Sit-ups"
    @State private var sportOptions: [String]?
    init() {
        sportOptions = Array(sportService.sportRepository.activeSport.keys)
    }

    var body: some View {
        VStack {
            Picker("Sport:", selection: $currentSport) {
                ForEach(sportOptions!, id: \.self) {
                    Text($0)
                }
            }
            .accentColor(.black)
            .onChange(of: currentSport) { newValue in
                trainingViewModel.setWeekActivity(ofType: newValue)
            }
            .pickerStyle(.menu)
        }
    }
}
