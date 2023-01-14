//
//  InputAmountView.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 14.12.2022.
//

import Foundation
import SwiftUI

struct InputAmountView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var trainingViewModel: TrainingViewModel
    @State var amount: String
    @State var showingAlert: Bool
    @State var isNotRightType: Bool
    @State var isAlreadyPlayed: Bool = false
    var body: some View {
        TextField("Done quantity:", text: $amount) {
            showingAlert = amount.isNumeric
            if trainingViewModel.trainingModel.type == "" {
                isNotRightType = true
            }

            if !showingAlert {
                trainingViewModel.increaseBy(amount: Int(amount) ?? 0)
            }
            print("====\n\(trainingViewModel.getCurrentAmount()) in InputAmountView and \(amount) in IAV")
        }
        .onSubmit {
            SoundService.playSounds(soundFile: "mixkit-quick-win-video-game-notification-269")
            amount = ""
            print(trainingViewModel.trainingModel.type)
        }
        .submitLabel(.done)
        .multilineTextAlignment(.center)
        .alert(isPresented: $isNotRightType) {
            Alert(
                title: Text("Invalid sport type"),
                message: Text("Change your current sport"),
                dismissButton: .default(Text("Got it."))
            )
        }
        .alert(isPresented: $showingAlert) {
            Alert(
                title: Text("Invalid input"),
                message: Text("Try enter another number"),
                dismissButton: .default(Text("Got it."))
            )
        }
    }

    init() {
        amount = ""
        showingAlert = false
        isNotRightType = false
    }

    // achieved-sound.wav
    /*
     func playSoundWhenAchieved(sound: String, ofType: String){
         print("Sound played")
         if let path = Bundle.main.path(forResource: sound, ofType: ofType){
             do{
                 audioPlayer = try AVAudioPlayer(contentsOf: URL(filePath: path))
                 audioPlayer?.play()
             }catch{
                 print("Audio can't be played")
             }
         }
     }
      */
}
