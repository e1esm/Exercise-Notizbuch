//
//  TabBarView.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 21.12.2022.
//

import Foundation
import SwiftUI

enum Tab: String, CaseIterable{
    case house
    case clock
    case person
}

struct TabView: View{
    @Binding var selectedTab: Tab
    private var circleImage: String{
        selectedTab.rawValue + ".circle"
    }
    var body: some View{
        HStack{
            ForEach(Tab.allCases, id: \.rawValue){tab in
                Spacer()
                Image(systemName: selectedTab == tab ? circleImage : tab.rawValue)
                    .resizable().scaledToFit()
                    .frame(height: 30)
                    .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
                    .foregroundColor(selectedTab == tab ? Color(UIColor(red: 0.47, green: 0.78, blue: 1.00, alpha: 1.00)) : .black)
                    .font(.system(size: 22))
                    .onTapGesture{
                        withAnimation(.easeIn(duration: 0.1)){
                            selectedTab = tab
                        }
                    }
                Spacer()
            }
        }
        .frame(width: 300,height: 50)
        .background(Color.clear)
        .cornerRadius(20)
        .padding()
    }
    
}

