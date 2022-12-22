//
//  ContentView.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 14.12.2022.
//

import SwiftUI
import CoreData
import UIKit
import CoreMotion
struct ContentView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var trainingViewModel: TrainingViewModel
    @State private var selectedTab: Tab = .house
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
                                            .frame(minWidth: 20, maxWidth: 25)
                                        Text(userViewModel.userModel!.getNickname())
                                            .frame(alignment: .leading)
                                            .font(Font.headline.bold())
                                        Spacer()
                                            .frame(minWidth: 7, maxWidth: 11)
                                        Image(uiImage: userViewModel.userModel!.getImage())
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 50, alignment: .trailing)
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
                        RoundedRectangle(
                            cornerRadius: 32)
                        .fill(Color(red: 0.88, green: 0.87, blue: 0.87))
                        .frame(width: 325, height: 60)
                        .overlay(
                            TabView(selectedTab: $selectedTab)
                            
                        )
                        Spacer()
                    }
                )
        }
        .frame(alignment: .center)
        .ignoresSafeArea(.keyboard)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserViewModel()).environmentObject(TrainingViewModel())
        
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
            .previewDisplayName("iPhone 14 Pro Max")
            .environmentObject(UserViewModel())
            .environmentObject(TrainingViewModel())
    }
}
