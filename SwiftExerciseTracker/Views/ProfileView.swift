//
//  ProfileView.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 21.12.2022.
//

import Foundation
import SwiftUI
import PhotosUI

struct ProfileView: View{
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    @EnvironmentObject var userViewModel: UserViewModel
    var body: some View{
        VStack(spacing: 20){
            Rectangle()
                .padding(-85)
                .foregroundColor(Color(red: 0.88, green: 0.87, blue: 0.87))
                .frame(width: UIScreen.main.bounds.width, height: 50)
                .ignoresSafeArea()
                .overlay(
                    HStack(spacing: 100){
                        PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()){
                            
                            Image(uiImage: userViewModel.userModel!.getImage())
                                .resizable()
                                .frame(width: 75, height: 75)
                                .clipShape(Circle())
                                .aspectRatio(contentMode: .fit)
                                .overlay(Circle().stroke(Color.black, lineWidth: 2))
                             
                            
                        }.onChange(of: selectedItem){ newItem in
                            Task{
                                if let data = try? await newItem?.loadTransferable(type: Data.self){
                                    selectedImageData = data
                                    userViewModel.updateProfileImage(newImage: UIImage(data: selectedImageData!)!)
                                }
                            }
                            
                        }
                        Text(userViewModel.userModel!.getNickname())
                            .font(.title2
                                .weight(.bold))
                    }.frame(alignment: .top)
                )
            Spacer()
            Text("Version 0.0.0")
            
        }
    }
}
