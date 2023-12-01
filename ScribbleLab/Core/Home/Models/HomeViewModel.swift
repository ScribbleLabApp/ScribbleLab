//
//  HomeViewModel.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 01.12.23.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var notificationSheetisPresented = false
    @Published var settingsViewSheetisPresented = false
    @Published var allowNotificationsIsGarnted = false
}
