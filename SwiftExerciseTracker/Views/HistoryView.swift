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
    var body: some View{
        ScrollView{
            Spacer()
                .frame(maxHeight: 10)
            
            LazyVStack(spacing: 25){
                VStack{
                    Chart {
                        BarMark(
                            x: .value("Mount", "jan/22"),
                            y: .value("Value", 5)
                        )
                        .foregroundStyle(Color.green)
                        BarMark(
                            x: .value("Mount", "fev/22"),
                            y: .value("Value", 4)
                        )
                        .foregroundStyle(Color.green)
                        BarMark(
                            x: .value("Mount", "mar/22"),
                            y: .value("Value", 7)
                        ).foregroundStyle(Color.green)
                    }
                    .frame(minWidth: 100, maxWidth: 400, minHeight: 100, maxHeight: 200)
                    SportPicker()
                }
                Divider()
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 400, height: 200)
                    .foregroundColor(Color(red: 0.88, green: 0.87, blue: 0.87))
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 400, height: 200)
                    .foregroundColor(Color(red: 0.88, green: 0.87, blue: 0.87))
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 400, height: 200)
                    .foregroundColor(Color(red: 0.88, green: 0.87, blue: 0.87))
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 400, height: 200)
                    .foregroundColor(Color(red: 0.88, green: 0.87, blue: 0.87))
            }

        }
        .background(Color(red: 0.97, green: 0.95, blue: 0.95))
    }
}

    
