//
//  SoundService.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 03.01.2023.
//

import AVFoundation
import Foundation
import UIKit

class SoundService: ObservableObject {
    static var audioPlayer: AVAudioPlayer?

    static func playSounds(soundFile: String) {
        print("Func to play sound")
        guard let audioData = NSDataAsset(name: soundFile)?.data else {
            fatalError("Unable to play sound")
        }
        do {
            audioPlayer = try AVAudioPlayer(data: audioData)
            audioPlayer?.play()
        } catch {
            print("Can't play exported sound")
        }
    }
}
