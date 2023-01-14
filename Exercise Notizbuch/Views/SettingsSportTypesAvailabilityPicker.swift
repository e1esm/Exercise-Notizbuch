//
//  SettingsSportTypesAvailabilityPicker.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 02.01.2023.
//

import Foundation
import SwiftUI

struct SheetSportPickerView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var sportService: SportService
    @EnvironmentObject var trainingViewModel: TrainingViewModel
    @State private var isCurrent: Bool = false

    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        VStack {
            ScrollView {
                Spacer()
                    .frame(height: 50)
                LazyVGrid(columns: columns, spacing: 70) {
                    ForEach(Array(sportService.sportRepository.activeSport.keys), id: \.self) { value in
                        if sportService.sportRepository.activeSport[value] == false {
                            Text(value)
                                .padding()
                                .background(
                                    Circle()
                                        .stroke(Color.black, lineWidth: 2)
                                        .frame(width: 100, height: 100)
                                        .padding(6)
                                )
                                .onTapGesture {
                                    isCurrent = changeState(key: value)
                                }
                        } else {
                            Text(value)
                                .padding()
                                .background(
                                    Circle()
                                        .stroke(Color.blue, lineWidth: 2)
                                        .frame(width: 100, height: 100)
                                        .padding(6)
                                )
                                .onTapGesture {
                                    isCurrent = changeState(key: value)
                                }.alert(isPresented: $isCurrent) {
                                    Alert(
                                        title: Text("It's a current sport type"), message: Text("You can't delete current type."),
                                        dismissButton: .default(Text("Got it"))
                                    )
                                }
                        }
                    }
                }
            }
            Spacer()
            Button("Press to go back.") {
                dismiss()
            }
        }.frame(width: UIScreen.main.bounds.width).background(Color(red: 0.97, green: 0.95, blue: 0.95))
    }

    func changeState(key: String) -> Bool {
        if key == trainingViewModel.trainingModel.type {
            return true
        }
        if sportService.sportRepository.activeSport[key] == false {
            sportService.changeStateOfSportArray(key: key, state: true)
        } else {
            sportService.changeStateOfSportArray(key: key, state: false)
        }
        return false
    }
}
