//
//  SportPicker.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 14.12.2022.
//

import Foundation
import SwiftUI


struct SportPicker: View{
    @EnvironmentObject var trainingViewModel: TrainingViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var sportService: SportService
    @State private var currentSport = "Sit-ups"
    var sportOptions: [String]{
        get{
            initSportArray()
        }
    }
    
    
    //let sportOptions = Array(SportRepository.activeSport.keys)
    /*
    let sportOptions = [    "Sit-ups",
                             "Push-ups",
                             "Abs",
                             "Lunges",]
    */
    var body: some View{
        VStack{
            Picker("Sport:", selection: $currentSport){
                ForEach(sportOptions, id: \.self){
                    Text($0)
                }
            }
            .accentColor(.black)
            .onChange(of: currentSport){newValue in
                trainingViewModel.updateCurrentAmount()
            }
            .pickerStyle(.menu)
        }
    }
    
    func initSportArray() -> [String]{
        return sportService.activeSport
    }
}
