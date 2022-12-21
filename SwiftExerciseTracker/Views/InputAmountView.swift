//
//  InputAmountView.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 14.12.2022.
//

import Foundation
import SwiftUI


struct InputAmountView: View{
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var trainingViewModel: TrainingViewModel

    @State var amount: String
    @State var showingAlert: Bool
    var body: some View{
        TextField("Done quantity:", text: $amount){
            showingAlert = amount.isNumeric
            if !showingAlert{
                trainingViewModel.increaseBy(amount: Int(amount)!)
            }
            print("====\n\(trainingViewModel.getCurrentAmount()) in InputAmountView and \(amount) in IAV")
        }
        .onSubmit {
            amount = ""
        }
        .submitLabel(.done)
        .multilineTextAlignment(.center)
                    .alert(isPresented: $showingAlert){
                        Alert(
                            title: Text("Invalid input"),
                            message: Text("Try enter another number"),
                            dismissButton: .default(Text("Got it."))
                        )
                    }
            }
    init(){
            amount = ""
            showingAlert = false
        }
        
    }
    
