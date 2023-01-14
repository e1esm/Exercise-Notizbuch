//
//  ProfileView.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 21.12.2022.
//

import Foundation
import PhotosUI
import SwiftUI

struct ProfileView: View {
    @State var newUsername: String = ""
    @State private var isShowingActiveSheet = false
    @State private var isShowingGoalSheet = false
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    @EnvironmentObject var userViewModel: UserViewModel
    var body: some View {
        VStack {
            Rectangle()
                .padding(-90)
                .foregroundColor(Color(red: 0.88, green: 0.87, blue: 0.87))
                .frame(width: UIScreen.main.bounds.width, height: 50)
                .ignoresSafeArea()
                .overlay(
                    VStack {
                        Spacer()
                            .frame(height: 20)
                        HStack(spacing: 100) {
                            PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
                                Image(uiImage: userViewModel.userModel!.getImage())
                                    .resizable()
                                    .frame(width: 75, height: 75)
                                    .clipShape(Circle())
                                    .aspectRatio(contentMode: .fit)
                                    .overlay(Circle().stroke(Color.black, lineWidth: 2))

                            }.onChange(of: selectedItem) { newItem in
                                Task {
                                    if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                        selectedImageData = data
                                        userViewModel.updateProfileImage(newImage: UIImage(data: selectedImageData!)!)
                                    }
                                }
                            }
                            Text(userViewModel.userModel!.getNickname())
                                .font(.title2
                                    .weight(.bold))
                                .frame(width: 100)
                        }.frame(alignment: .bottom)
                    }
                )
            Spacer()
                .frame(minHeight: 20, maxHeight: 50)

            RoundedRectangle(cornerRadius: 32)
                .foregroundColor(Color(red: 0.88, green: 0.87, blue: 0.87))
                .frame(minWidth: 250, maxWidth: 350, minHeight: 25, maxHeight: 75)
                .shadow(color: Color(red: 0.88, green: 0.87, blue: 0.87), radius: 16)
                .overlay(
                    HStack(spacing: 100) {
                        Text("Pick active sport")
                        ZStack {
                            Button("Show sheet") {
                                isShowingActiveSheet.toggle()
                            }.sheet(isPresented: $isShowingActiveSheet) {
                                SheetSportPickerView()
                            }
                        }
                    }
                )
            Spacer()
                .frame(minHeight: 10, maxHeight: 30)
            RoundedRectangle(cornerRadius: 32)
                .foregroundColor(Color(red: 0.88, green: 0.87, blue: 0.87))
                .frame(minWidth: 250, maxWidth: 350, minHeight: 25, maxHeight: 75)
                .shadow(color: Color(red: 0.88, green: 0.87, blue: 0.87), radius: 16)
                .overlay(
                    HStack {
                        Spacer()
                            .frame(width: 5)
                        Text("Change nickname")
                            .frame(width: 150)
                        Spacer()
                            .frame(width: 100)
                        TextField("Nickname:", text: $newUsername) {}.onSubmit {
                            userViewModel.updateUserName(newUsername: newUsername)
                            newUsername = ""
                        }.frame(width: 100)
                    }
                )
            Spacer()
                .frame(minHeight: 10, maxHeight: 30)
            RoundedRectangle(cornerRadius: 32)
                .foregroundColor(Color(red: 0.88, green: 0.87, blue: 0.87))
                .frame(minWidth: 250, maxWidth: 350, minHeight: 25, maxHeight: 75)
                .shadow(color: Color(red: 0.88, green: 0.87, blue: 0.87), radius: 16)
                .overlay(
                    HStack(spacing: 110) {
                        Text("Change goals")
                        ZStack {
                            Button("Show sheet") {
                                isShowingGoalSheet.toggle()
                            }.sheet(isPresented: $isShowingGoalSheet) {
                                GoalChangerView()
                            }
                        }
                    }
                )

            Spacer()
            Text("Version 0.0.0")

        }.background(Color(red: 0.97, green: 0.95, blue: 0.95))
    }
}
