//
//  ProgressView.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 14.12.2022.
//

import AVFoundation
import Foundation
import SwiftUI

struct QuantityProgressView: View {
    @EnvironmentObject var trainingViewModel: TrainingViewModel
    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    Color.gray,
                    lineWidth: 20
                )
                .frame(width: 150, alignment: .center)
                .overlay(
                    Text("\(trainingViewModel.getCurrentAmount()) / \(trainingViewModel.getGoalInQuantity())")
                        .font(.title2)
                )
            if trainingViewModel.getCurrentAmount() < 100 {
                Circle()
                    .trim(from: 0, to: CGFloat(CGFloat(trainingViewModel.getCurrentAmount()) / CGFloat(trainingViewModel.getGoalInQuantity())))
                    .stroke(
                        Color(UIColor(red: 0.71, green: 0.95, blue: 0.77, alpha: 1.00)).opacity(1),
                        lineWidth: 20
                    )
                    .rotationEffect(.degrees(-90))
                    .frame(width: 150, alignment: .center)
                    .animation(.easeInOut, value: trainingViewModel.getCurrentAmount())
            } else {
                Circle()
                    .trim(from: 0, to: CGFloat(CGFloat(trainingViewModel.getCurrentAmount()) / 100.0))
                    .stroke(
                        Color(UIColor(red: 0.71, green: 0.95, blue: 0.77, alpha: 1.00)).opacity(1),
                        lineWidth: 20
                    )
                    .rotationEffect(.degrees(-90))
                    .frame(width: 150, alignment: .center)
                    .animation(.easeInOut, value: trainingViewModel.getCurrentAmount())
            }
        }
    }
}
