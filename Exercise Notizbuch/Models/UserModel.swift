//
//  UserModel.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 14.12.2022.
//

import Foundation
import UIKit

class UserModel {
    private var nickname: String
    private var isSoundPlayed: Bool
    private var isSignedUp: Bool
    private var profileImage: UIImage = .init(named: "profileImage")!
    init() {
        isSignedUp = false
        isSoundPlayed = true
        nickname = ""
    }

    init(_ isSignedUp: Bool, sound: Bool, nickname: String) {
        self.isSignedUp = isSignedUp
        isSoundPlayed = sound
        self.nickname = nickname
    }

    init(_ isSignedUp: Bool, sound: Bool, nickname: String, profilePhoto: UIImage) {
        self.isSignedUp = isSignedUp
        isSoundPlayed = sound
        self.nickname = nickname
        profileImage = profilePhoto
    }

    public func setNewImage(image: UIImage) {
        profileImage = image
    }

    public func getImage() -> UIImage {
        profileImage
    }

    public func getNickname() -> String {
        nickname
    }

    public func setNickname(newNickanem: String) {
        nickname = newNickanem
    }

    public func getIsSignedUp() -> Bool {
        isSignedUp
    }

    public func setIsSignedUp(isSignedUp: Bool) {
        self.isSignedUp = isSignedUp
    }

    public func getSoundAccessState() -> Bool {
        isSoundPlayed
    }

    public func updateSoundAccessState(soundAccessState: Bool) {
        isSoundPlayed = soundAccessState
    }
}
