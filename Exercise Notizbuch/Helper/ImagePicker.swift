//
//  ImagePicker.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 02.01.2023.
//

import Foundation
import PhotosUI
import SwiftUI

@MainActor
class ImagePicker: ObservableObject {
    @Published var image: UIImage?
    @Published var imageSelection: PhotosPickerItem? {
        didSet {
            if let imageSelection {
                Task {
                    try await loadTransferable(from: imageSelection)
                }
            }
        }
    }

    func loadTransferable(from imageSelection: PhotosPickerItem?) async throws {
        do {
            if let data = try await imageSelection?.loadTransferable(type: Data.self) {
                if let uiImage = UIImage(data: data) {
                    image = uiImage
                }
            }
        } catch {
            print(error.localizedDescription)
            image = nil
        }
    }

    func getNewImage() -> UIImage {
        image!
    }
}
