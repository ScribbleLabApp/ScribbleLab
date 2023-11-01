//
//  SettingsViewModel.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 31.10.23.
//

import Foundation

class SettingsViewModel: ObservableObject {
    func fetchUser() async throws {
        try await SLAuthService.shared.loadUserData()
    }
}
