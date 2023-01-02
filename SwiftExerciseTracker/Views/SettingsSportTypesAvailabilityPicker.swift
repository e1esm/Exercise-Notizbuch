//
//  SettingsSportTypesAvailabilityPicker.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 02.01.2023.
//

import Foundation
import SwiftUI


struct SheetSportPickerView : View{
    @Environment(\.dismiss) var dismiss
    var body: some View{
        VStack{
            Spacer()
            Button("Press to dismiss"){
                dismiss()
            }
        }.frame(width: UIScreen.main.bounds.width).background(Color(red: 0.97, green: 0.95, blue: 0.95))
        
    }
}
