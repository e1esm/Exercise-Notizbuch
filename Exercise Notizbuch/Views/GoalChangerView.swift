//
//  GoalChangerView.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 02.01.2023.
//

import Foundation
import SwiftUI

struct GoalChangerView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var sportService: SportService
    @EnvironmentObject private var trainingViewModel: TrainingViewModel
    private var userDefaults = UserDefaults.standard
    @State private var isCurrent: Bool = false
    @State private var desiredAmount: String = ""
    @State private var pickedSport: String?
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        VStack {
            ScrollView {
                Spacer()
                    .frame(height: 50)
                LazyVGrid(columns: columns, spacing: 70) {
                    ForEach(Array(sportService.sportRepository.activeSport.keys), id: \.self) { value in
                        Text("\(value)\n\(userDefaults.integer(forKey: "\(value)Goal"))")
                            .multilineTextAlignment(.center)
                            .padding()
                            .background(
                                Circle()
                                    .stroke(Color.blue, lineWidth: 2)
                                    .frame(width: 100, height: 100)
                                    .padding(6)
                            )
                            .onTapGesture {
                                pickedSport = value
                                print(pickedSport)
                                isCurrent = true
                            }.alert("Enter desired Goal", isPresented: $isCurrent, actions: {
                                TextField("Goal", text: $desiredAmount)

                                Button("Submit", action: {
                                    updateGoal(ofType: pickedSport!, desiredAmount: Int(desiredAmount)!)
                                    desiredAmount = ""
                                })
                                Button("Cancel", role: .cancel, action: {
                                    desiredAmount = ""
                                })
                            }, message: {
                                Text("")
                            })
                    }
                }
                Spacer()
                    .frame(minHeight: 10, maxHeight: 20)
                Text("Steps\n\(userDefaults.integer(forKey: "StepsGoal"))")
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(
                        Circle()
                            .stroke(Color.blue, lineWidth: 2)
                            .frame(width: 100, height: 100)
                            .padding(6)
                    ).onTapGesture {
                        pickedSport = "Steps"
                        print(pickedSport)
                        isCurrent = true
                    }.alert("Enter desired Goal", isPresented: $isCurrent, actions: {
                        TextField("Goal", text: $desiredAmount)

                        Button("Submit", action: {
                            userDefaults.set(Int(desiredAmount)!, forKey: "StepsGoal")
                            desiredAmount = ""
                        })
                        Button("Cancel", role: .cancel, action: {
                            desiredAmount = ""
                        })
                    }, message: {
                        Text("")
                    })
            }

            Spacer()
            Button("Press to go back.") {
                dismiss()
            }
        }.frame(width: UIScreen.main.bounds.width).background(Color(red: 0.97, green: 0.95, blue: 0.95))
    }

    func updateGoal(ofType: String, desiredAmount: Int) {
        print("UpdateGoal: \(ofType)")
        trainingViewModel.setNewGoal(amount: desiredAmount, type: ofType)
    }
}
