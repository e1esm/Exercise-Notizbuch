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
    @State private var currentSport = "Sit-ups"
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
                            y: .value("Amount", trainingViewModel.getWeeklyActivity()[4])
                            
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
                        }
                        .pickerStyle(.menu)
                    }
                }
                Divider()
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(minWidth: 250, maxWidth: 350, minHeight: 100, maxHeight: 200)
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
            }
            
        }
        .background(Color(red: 0.97, green: 0.95, blue: 0.95))
    }
    
    func getDatesArray() -> [String]{
        return trainingViewModel.getWeekDatesArray()
    }
}

    
