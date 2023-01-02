//
//  TabBarView.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 21.12.2022.
//

import Foundation
import SwiftUI

struct TabViewScreen: View{
    
    init(){
        UITabBar.appearance().backgroundColor = UIColor(Color(red: 0.88, green: 0.87, blue: 0.87))
        UITabBar.appearance().barTintColor = UIColor(Color(red: 0.88, green: 0.87, blue: 0.87))
        
    }
    var body: some View{
        TabView{
            MainView()
                .tabItem(){
                    ZStack{
                        Image(systemName: "house.circle")
                        Text("Home")
                    }
                }
            HistoryView()
                .tabItem(){
                    ZStack{
                        Image(systemName: "clock.circle")
                        Text("History")
                        
                    }
                    
                }
            ProfileView()
                .tabItem(){
                    ZStack{
                        Image(systemName: "person.circle")
                        Text("Profile")
                    }
                }
        }
        
    }
    
}


