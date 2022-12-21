//
//  UserModel.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 14.12.2022.
//

import Foundation
import UIKit



class UserModel{
    private var nickname: String
    private var isSoundPlayed: Bool
    private var isSignedUp: Bool
    //private var profileImage: UIImage?
    private var profileImage: UIImage = UIImage(named: "profileImage")!
    init(){
        isSignedUp = false
        isSoundPlayed = true
        nickname = ""
    }
    
    init(_ isSignedUp: Bool, sound: Bool, nickname: String){
        self.isSignedUp = isSignedUp
        self.isSoundPlayed = sound
        self.nickname = nickname
    }
    init(_ isSignedUp: Bool, sound: Bool, nickname: String, profilePhoto: UIImage){
        self.isSignedUp = isSignedUp
        self.isSoundPlayed = sound
        self.nickname = nickname
        profileImage = profilePhoto
    }
    
    
    public func setNewImage(image: UIImage){
        self.profileImage = image
    }
    
    public func getImage() -> UIImage{
        return profileImage
    }
    
    public func getNickname() -> String{
        return nickname
    }
    
    
    public func setNickname(newNickanem: String){
        self.nickname = newNickanem
    }
    
    
    public func getIsSignedUp()-> Bool{
        return isSignedUp
    }
    
    
    public func setIsSignedUp(isSignedUp: Bool){
        self.isSignedUp = isSignedUp
    }
    
    
    public func getSoundAccessState()-> Bool{
        return isSoundPlayed
    }
    
    public func updateSoundAccessState(soundAccessState: Bool){
        self.isSoundPlayed = soundAccessState
    }
    
    
    
}
