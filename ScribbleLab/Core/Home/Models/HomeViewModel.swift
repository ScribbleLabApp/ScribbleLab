//
//  HomeViewModel.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 01.12.23.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    @Published var notificationSheetisPresented = false
    @Published var settingsViewSheetisPresented = false
    @Published var allowNotificationsIsGarnted = false
    @Published var createDialogDisplayed = false
    
    @Published var displayStyle: SortOption = .symbols
    
    // DEV
    @Published var newNotification = false
}
