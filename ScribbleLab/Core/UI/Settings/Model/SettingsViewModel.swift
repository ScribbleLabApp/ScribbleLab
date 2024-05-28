//
//  SettingsViewModel.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 31.10.23.
//

import Foundation

/// A Class that is responsible for all general setting options:
/// Tasks:
/// - Fetch the user's account data (Username, Email, Password)
/// - Store those data in ProfileViewModel
class SettingsViewModel: ObservableObject {
    func fetchUser() async throws {
        try await SLAuthService.shared.loadUserData()
    }
}
