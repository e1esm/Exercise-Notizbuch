//
//  MainView.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 02.01.2023.
//

import Foundation
import SwiftUI


struct MainView : View{
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var trainingViewModel: TrainingViewModel
        var body: some View {
            VStack{
                    Rectangle()
                    .fill(Color(red: 0.88, green: 0.87, blue: 0.87))
                    .ignoresSafeArea()
                    .padding(-20)
                    .overlay(
                        VStack{
                            HStack{
                                Spacer(minLength: 50)
                                RoundedRectangle(cornerRadius: 50)
                                    .fill(.white)
                                    .frame(width: 150, height: 50)
                                    .padding(20)
                                    .overlay(
                                        HStack{
                                            Spacer()
                                                .frame(minWidth: 15, maxWidth: 20)
                                            Text(userViewModel.userModel!.getNickname())
                                                .frame(width: 85,alignment: .leading)
                                                .lineLimit(1)
                                                .font(Font.headline.bold())
                                            Spacer()
                                                .frame(minWidth: 1, maxWidth: 3)
                                            
                                                    Image(uiImage: userViewModel.userModel!.getImage())
                                                        .resizable()
                                                        .frame(width: 50, height: 50)
                                                        .clipShape(Circle())
                                                        .aspectRatio(contentMode: .fit)
                                                        .overlay(Circle().stroke(Color.black, lineWidth: 2))
                                        }
                                    )
                                    .frame(width: 150, height: 50, alignment: .trailing)
                                
                            }
                            
                            Spacer()
                                .frame(height: 25)
                            Text("Quantity estimated")
                                .font(Font.title2)
                                .padding(-10)
                            Spacer()
                                .frame(height: 35)
                            QuantityProgressView()
                            Spacer()
                                .frame(height: 35)
                            HStack(spacing: 1){
                                Rectangle()
                                    .fill(.white)
                                    .frame(width: 120, height: 50)
                                    .overlay(
                                        SportPicker()
                                    )
                                Rectangle()
                                    .fill(.gray)
                                    .frame(width: 1, height: 50)
                                Rectangle()
                                    .fill(.white)
                                    .frame(width: 125, height: 50)
                                    .overlay(
                                        InputAmountView()
                                            .frame(alignment: .leading)
                                    )
                                    
                            }
                            Spacer()
                        }
                    )
                Rectangle()
                    .fill(Color(red: 0.97, green: 0.95, blue: 0.95))
                    .ignoresSafeArea()
                    .overlay(
                        VStack{
                            Spacer()
                                .frame(minHeight: 1, maxHeight: 15)
                            Text("Steps estimated")
                                .font(Font.title2)
                            Spacer()
                                .frame(height: 35)
                            StepsProgressView()
                            Spacer()
                                .frame(minHeight: 35, maxHeight: 70)
                        }
                    )
            }
            .frame(alignment: .center)
            .ignoresSafeArea(.keyboard)
        }
        
    }
