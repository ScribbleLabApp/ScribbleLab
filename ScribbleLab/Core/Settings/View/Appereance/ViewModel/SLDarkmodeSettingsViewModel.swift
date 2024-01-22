//
//  SLDarkmodeSettingsViewModel.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 22.01.24.
//

import SwiftUI
import Foundation

@MainActor
class SLDarkmodeSettingsViewModel: ObservableObject {
    @Published var customThemeDialogDisplayed: Bool = false
}
