//
//  CircleCheckboxModel.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 22.01.24.
//

import UIKit
import SwiftUI
import Foundation

enum ThemeState: Equatable {
    case alwaysDark
    case alwaysLight
    case systemSettings
}

class CircleCheckboxModel: ObservableObject {
    @Published var useSystemColor: Bool = true
    
    @Published var selectedTheme: ThemeState = .alwaysLight
    @Published var currentAppTheme: ColorScheme = .light
    
    func switchTheme() {
        switch selectedTheme {
        case .alwaysDark:
            currentAppTheme = .dark
        case .alwaysLight:
            currentAppTheme = .light
        case .systemSettings:
//            currentAppTheme = ColorScheme.current
            if let colorScheme = UIApplication.shared.windows.first?.traitCollection.userInterfaceStyle {
                currentAppTheme = colorScheme == .dark ? .dark : .light
            }
        }
    }
}
