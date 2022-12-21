//
//  UserViewModel.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 18.12.2022.
//

import Foundation
import SQLite3
import UIKit
import SwiftUI
class UserViewModel: ObservableObject{
    var userDefaults = UserDefaults.standard
    var dbManager: DBManager
    var userModel: UserModel?
    
    init(){
        self.dbManager = DBManager.instance
        if userDefaults.object(forKey: "isSignedUp") == nil{
            userDefaults.set(true, forKey: "isSignedUp")
            let username: String = randomNickname()
            userDefaults.set(username, forKey: "username")
            userDefaults.set(true, forKey: "isSoundPlayed")
            userDefaults.set(UIImage(named: "profileImage"), forKey: "profileImage")
            userDefaults.set(DateFormatter().string(from: Date()), forKey: "lastOpening")
            self.userModel = UserModel(true,sound: true, nickname: username, profilePhoto: UIImage(named: "profileImage")!)
        }else{
            let isSignedUp = userDefaults.bool(forKey: "isSignedUp")
            let username = userDefaults.string(forKey: "username")
            let isSoundPlayed = userDefaults.bool(forKey: "isSoundPlayed")
            
            let profileImage = userDefaults.object(forKey: "profileImage") ?? nil
            
            if profileImage == nil{
                userModel = UserModel(isSignedUp, sound: isSoundPlayed, nickname: username!, profilePhoto: UIImage(named: "profileImage")!)
            }else{
                userModel = UserModel(isSignedUp, sound: isSoundPlayed, nickname: username!, profilePhoto: profileImage as! UIImage)
            }
            
        }
        
    }
    
    func randomNickname() -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<6).map{ _ in letters.randomElement()! })
    }
    
    
    
}
