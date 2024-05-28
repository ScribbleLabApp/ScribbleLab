//
//  ImagePicker.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 03.11.23.
//

import SwiftUI
import PhotosUI

@MainActor
class ImagePicker: ObservableObject {
    @Published var image: Image?
    @Published var imageSelection: PhotosPickerItem? {
        didSet {
            if let imageSelection {
                Task { try await loadTransferable(from: imageSelection) }
            }
        }
    }
    
    func loadTransferable(from imageSelection: PhotosPickerItem?) async throws {
        print("DEBUG: \(Image.transferRepresentation)")
        do {
            if let data = try await imageSelection?.loadTransferable(type: Data.self) {
                if let uiImage = UIImage(data: data) {
                    self.image = Image(uiImage: uiImage)
                }
            }
        } catch {
            print("DEBUG: Profile picture selection and loading failed with error:\(error.localizedDescription)")
            image = nil
        }
    }
}
