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
    @EnvironmentObject var sportService: SportService
    @EnvironmentObject private var trainingViewModel: TrainingViewModel
    private var userDefaults = UserDefaults.standard
    @State private var isCurrent: Bool = false
    @State private var desiredAmount: String = ""
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
        var body: some View{
            VStack{
                ScrollView{
                    Spacer()
                        .frame(height: 50)
                    LazyVGrid(columns: columns, spacing: 70){
                        ForEach(Array(sportService.sportRepository.activeSport.keys), id: \.self){ value in
                            if(sportService.sportRepository.activeSport[value] == false){
                                Text("\(value)\n\(userDefaults.integer(forKey: "\(value)Goal"))")
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    .background(
                                        Circle()
                                            .stroke(Color.black, lineWidth: 2)
                                            .frame(width: 100, height: 100)
                                            .padding(6)
                                    )
                                    .onTapGesture {
                                       isCurrent = true
                                    }
                            }else{
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
                                        isCurrent = true
                                    }.alert("Login", isPresented: $isCurrent, actions: {
                                        TextField("Username", text: $desiredAmount)
                                        
                                        Button("Submit", action: {
                                            updateGoal(ofType: trainingViewModel.trainingModel.type, desiredAmount: Int(desiredAmount)!)
                                        })
                                        Button("Cancel", role: .cancel, action: {
                                            desiredAmount = ""
                                        })
                                    }, message: {
                                        Text("Please enter your username and password.")
                                    })
                            }
                        }
                    }
                }
                Spacer()
                Button("Press to go back."){
                    dismiss()
                }
            }.frame(width: UIScreen.main.bounds.width).background(Color(red: 0.97, green: 0.95, blue: 0.95))
            
        }
    
    func updateGoal(ofType: String, desiredAmount: Int){
        trainingViewModel.setNewGoal(amount: desiredAmount, type: ofType)
    }
        
}
