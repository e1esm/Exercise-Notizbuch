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
            saveProfileImage(newProfileImage: UIImage(named: "profileImage")!)
            //userDefaults.set(UIImage(named: "profileImage"), forKey: "profileImage")
            userDefaults.set(DateFormatter().string(from: Date()), forKey: "lastOpening")
            self.userModel = UserModel(true,sound: true, nickname: username, profilePhoto: UIImage(named: "profileImage")!)
        }else{
            let isSignedUp = userDefaults.bool(forKey: "isSignedUp")
            let username = userDefaults.string(forKey: "username")
            let isSoundPlayed = userDefaults.bool(forKey: "isSoundPlayed")
            
            let profileImage = getProfileImage()
            
            if profileImage == nil{
                userModel = UserModel(isSignedUp, sound: isSoundPlayed, nickname: username!, profilePhoto: UIImage(named: "profileImage")!)
            }else{
                userModel = UserModel(isSignedUp, sound: isSoundPlayed, nickname: username!, profilePhoto: profileImage!)
            }
            
        }
        
    }
    
    func updateProfileImage(newImage: UIImage){
        userModel?.setNewImage(image: newImage)
        print("Image's updated")
        saveProfileImage(newProfileImage: newImage)
        self.objectWillChange.send()
        
    }
    
    func saveProfileImage(newProfileImage: UIImage){
        guard let data = newProfileImage.jpegData(compressionQuality: 0.5) else {return}
        let encodedImageData = try! PropertyListEncoder().encode(data)
        userDefaults.set(encodedImageData, forKey: "profileImage")
    }
    
    func getProfileImage() -> UIImage?{
        guard let data = userDefaults.data(forKey: "profileImage") else {return nil}
        let decoded = try! PropertyListDecoder().decode(Data.self, from: data)
        return UIImage(data: decoded)
    }
    
    func randomNickname() -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<6).map{ _ in letters.randomElement()! })
    }
    
    func updateUserName(newUsername: String){
        userModel?.setNickname(newNickanem: newUsername)
        userDefaults.set(newUsername, forKey: "username")
        self.objectWillChange.send()
    }
    
    
}
