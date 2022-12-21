//
//  StepsProgressView.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 21.12.2022.
//

import Foundation
import SwiftUI
import UIKit
import CoreMotion


struct StepsProgressView: View{
    @EnvironmentObject var trainingViewModel: TrainingViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    private let pedometer = CMPedometer()
    
    private var isPedometerAvailable: Bool{
        return CMPedometer.isPedometerEventTrackingAvailable() && CMPedometer.isDistanceAvailable() && CMPedometer.isStepCountingAvailable()
    }
    
    private func initPedometer(){
        if isPedometerAvailable{
            pedometer.startUpdates(from: Date()){(data, error) in
                guard let data = data, error == nil else {return}
                
                print("\(data.numberOfSteps.intValue)")
                DispatchQueue.main.async {
                    trainingViewModel.setCurrentSteps(steps: data.numberOfSteps.intValue)
                }
            }
        }
    }
    
    var body: some View{
        ZStack{
            Circle()
                .stroke(
                    Color.gray,
                    lineWidth: 20
                )
                .frame(width: 150, alignment: .center)
                .overlay(
                    Text("\(trainingViewModel.getCurrentSteps()) / \(trainingViewModel.getStepsGoal())".replacingOccurrences(of: ",", with: ""))
                        .font(.title2)
                    
                )
            
            Circle()
                .trim(from: 0, to: CGFloat(CGFloat(trainingViewModel.getCurrentSteps())/1000.0))
                .stroke(
                    Color(UIColor(red: 0.47, green: 0.78, blue: 1.00, alpha: 1.00)).opacity(1),
                    lineWidth: 20
                )
                .rotationEffect(.degrees(-90))
                .frame(width: 150, alignment: .center)
                .animation(.easeInOut, value: trainingViewModel.getCurrentSteps())
                .onAppear{
                    self.initPedometer()
                }
                .onDisappear{
                    pedometer.stopUpdates()
                }
                }
            
        }
            
    }
