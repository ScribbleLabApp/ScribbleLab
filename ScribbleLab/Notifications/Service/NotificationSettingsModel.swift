//
//  NotificationSettings.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 14.01.24.
//

import SwiftUI

public class NotificationSettingsModel: ObservableObject {
    @Published var notificationAllowed: Bool = false
    @Published var notifyWhenChangesMade: Bool = false // true
    @Published var notifyWhenRecievedInvitation: Bool = false // true
    @Published var notifyWhenAppUpdates: Bool = false // true
    
    func resetNotificationSettings() {
        notifyWhenChangesMade = true
        notifyWhenRecievedInvitation = true
        notifyWhenAppUpdates = true
    }
}
