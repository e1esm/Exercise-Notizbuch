//
//  HistoryView.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 21.12.2022.
//

import Foundation
import SwiftUI
import Charts


struct HistoryView: View{
    @EnvironmentObject private var trainingViewModel: TrainingViewModel
    @EnvironmentObject private var sportService: SportService
    @State private var currentSport: String = "Sit-ups"
    
    private var sportOptions: [String]{
        get{
            Array(sportService.sportRepository.activeSport.keys)
        }
    }
    
    private var dates: [String]{
        get{
            trainingViewModel.getWeekDatesArray()
        }
    }
    
    
    var body: some View{
        ScrollView{
            Spacer()
                .frame(maxHeight: 10)
            
            LazyVStack(spacing: 25){
                VStack{
                    Chart {
                        BarMark(
                            x: .value("Date", String(dates[0].suffix(5))),
                            y: .value("Amount", trainingViewModel.getWeeklyActivity()[0])
                        )
                        .foregroundStyle(Color(UIColor(red: 0.71, green: 0.95, blue: 0.77, alpha: 1.00)).opacity(1))
                        BarMark(
                            x: .value("Date", String(dates[1].suffix(5))),
                            y: .value("Amount", trainingViewModel.getWeeklyActivity()[1])
                        )
                        .foregroundStyle(Color(UIColor(red: 0.71, green: 0.95, blue: 0.77, alpha: 1.00)).opacity(1))
                        BarMark(
                            x: .value("Date", String(dates[2].suffix(5))),
                            y: .value("Amount", trainingViewModel.getWeeklyActivity()[2])
                            
                        ).foregroundStyle(Color(UIColor(red: 0.71, green: 0.95, blue: 0.77, alpha: 1.00)).opacity(1))
                        BarMark(
                            x: .value("Date", String(dates[3].suffix(5))),
                            y: .value("Amount", trainingViewModel.getWeeklyActivity()[3])
                            
                        ).foregroundStyle(Color(UIColor(red: 0.71, green: 0.95, blue: 0.77, alpha: 1.00)).opacity(1))
                        BarMark(
                            x: .value("Date", String(dates[4].suffix(5))),
                            y: .value("Amount", trainingViewModel.getWeeklyActivity()[4 ])
                            
                        ).foregroundStyle(Color(UIColor(red: 0.71, green: 0.95, blue: 0.77, alpha: 1.00)).opacity(1))
                        BarMark(
                            x: .value("Date", String(dates[5].suffix(5))),
                            y: .value("Amount", trainingViewModel.getWeeklyActivity()[5])
                            
                        ).foregroundStyle(Color(UIColor(red: 0.71, green: 0.95, blue: 0.77, alpha: 1.00)).opacity(1))
                        BarMark(
                            x: .value("Date", String(dates[6].suffix(5))),
                            y: .value("Amount", trainingViewModel.getWeeklyActivity()[6])
                            
                        ).foregroundStyle(Color(UIColor(red: 0.71, green: 0.95, blue: 0.77, alpha: 1.00)).opacity(1))
                    }
                    .frame(minWidth: 100, maxWidth: 400, minHeight: 100, maxHeight: 200)
                    VStack{
                        Picker("Sport:", selection: $currentSport){
                            ForEach(sportOptions, id: \.self){
                                Text($0)
                            }
                        }
                        .accentColor(.black)
                        .onChange(of: currentSport){newValue in
                            trainingViewModel.setWeekActivity(ofType: newValue)
                            UserDefaults.standard.setValue(newValue, forKey: "ChartPickerLastSet")
                        }
                        .pickerStyle(.menu)
                    }
                }
                Divider()
                ForEach(trainingViewModel.getArrayOfWeekActivities()){ value in
                        RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color(red: 0.88, green: 0.87, blue: 0.87))
                            .frame(minWidth: 250, maxWidth: 350, minHeight: 100, maxHeight: 200)
                            .overlay(
                                HStack(spacing: 70){
                                    VStack(spacing: 10){
                                        Text(value.getCurrentDate())
                                            .foregroundColor(Color.black)
                                            .bold()
                                        Image(systemName: "checkmark")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .scaledToFit()
                                            .foregroundColor(Color(UIColor(red: 0.71, green: 0.95, blue: 0.77, alpha: 1.00)).opacity(1))
                                    }
                                    VStack(spacing: 20){
                                        Text(value.getSportType())
                                            .frame(width: 125)
                                        .foregroundColor(Color.black)
                                        .bold()
                                        Text(String(value.getCurrentQuantity()))
                                            .frame(width: 75)
                                        .foregroundColor(Color.black)
                                        .bold()
                                    }
                                }
                                
                            )
                    }
                    /*
                     RoundedRectangle(cornerRadius: 20)
                     .frame(minWidth: 250, maxWidth: 350, minHeight: 100, maxHeight: 200)
                     .overlay(
                     HStack(spacing: 70){
                     VStack(spacing: 10){
                     Text(trainingViewModel.dailyActivity["2023-01-04"]![0].getCurrentDate())
                     .foregroundColor(Color.black)
                     .bold()
                     Image(systemName: "checkmark")
                     .resizable()
                     .frame(width: 30, height: 30)
                     .scaledToFit()
                     .foregroundColor(Color(UIColor(red: 0.71, green: 0.95, blue: 0.77, alpha: 1.00)).opacity(1))
                     }
                     VStack(spacing: 20){
                     Text(trainingViewModel.dailyActivity["2023-01-04"]![0].getSportType())
                     .foregroundColor(Color.black)
                     .bold()
                     Text(String(trainingViewModel.dailyActivity["2023-01-04"]![0].getCurrentQuantity()))
                     .foregroundColor(Color.black)
                     .bold()
                     }
                     }
                     )
                     
                    .foregroundColor(Color(red: 0.88, green: 0.87, blue: 0.87))
                    RoundedRectangle(cornerRadius: 20)
                        .frame(minWidth: 250, maxWidth: 350, minHeight: 100, maxHeight: 200)
                        .foregroundColor(Color(red: 0.88, green: 0.87, blue: 0.87))
                    RoundedRectangle(cornerRadius: 20)
                        .frame(minWidth: 250, maxWidth: 350, minHeight: 100, maxHeight: 200)
                        .foregroundColor(Color(red: 0.88, green: 0.87, blue: 0.87))
                    RoundedRectangle(cornerRadius: 20)
                        .frame(minWidth: 250, maxWidth: 350, minHeight: 100, maxHeight: 200)
                        .foregroundColor(Color(red: 0.88, green: 0.87, blue: 0.87))
                     */
                }
                
            }
            .onAppear{
                refreshActivityArray()
                //print(trainingViewModel.getArrayOfWeekActivities()[0].getSportType())
                print(trainingViewModel.getArrayOfWeekActivities().count)
            }
            .background(Color(red: 0.97, green: 0.95, blue: 0.95))
        }
        
        func getDatesArray() -> [String]{
            return trainingViewModel.getWeekDatesArray()
        }
        func refreshActivityArray(){
            if(UserDefaults.standard.string(forKey: "ChartPickerLastSet") == nil){
                trainingViewModel.setWeekActivity(ofType: currentSport)
            }else{
                trainingViewModel.setWeekActivity(ofType: UserDefaults.standard.string(forKey: "ChartPickerLastSet")!)
            }
        }
    }

    
