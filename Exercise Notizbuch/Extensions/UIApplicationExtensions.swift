//
//  UIApplicationExtensions.swift
//  Exercise Notizbuch
//
//  Created by Егор Михайлов on 14.01.2023.
//

import Foundation
import UIKit

extension UIApplication {
    static var appVersion: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
}
