//
//  NotificationSettingsView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 09.03.24.
//

import SwiftUI
import Setting

struct NotificationSettingsView: View {
    @AppStorage("notificationsGranted") var notificationsGranted: Bool = true // TODO: link with AppDelegate
    @AppStorage("notifyWhenChangesMade") var notifyWhenChangesMade: Bool = true
    @AppStorage("notifyWhenRecievedInvitation") var notifyWhenRecievedInvitation: Bool = false
    @AppStorage("instructionsTippsTricks") var instructionsTippsTricks: Bool = true
    @AppStorage("tutorials") var tutorials: Bool = false
    @AppStorage("otherNotifications") var otherNotifications: Bool = true
    @AppStorage("newFunctions") var newFunctions: Bool = true
    
    /**
     InAppNotifications are used to display critical alerts or to show feedback. It can not be disabled by default.
     */
    @AppStorage("inAppNotifications") var inAppNotifications: Bool = true
    
    /**
     UpdateReminders are used to remind the user to update their ScribbleLab version. It can not be disabled by default.
     */
    @AppStorage("updateReminders") var updateReminders: Bool = true
    
    /**
     Reset modified NotificationSettings.
     */
    func resetSettings() {
        notifyWhenChangesMade = true
        notifyWhenRecievedInvitation = true
        instructionsTippsTricks = true
        tutorials = false
        otherNotifications = true
        newFunctions = true
        
        inAppNotifications = true
        updateReminders = true
    }
    
    var body: some View {
        SettingStack {
            SettingPage(title: "Notifications") {
                SettingGroup(footer: "Stay up to date with push notifications.") {
                    SettingToggle(title: "Allow notifications", isOn: $notificationsGranted)
                }
                
                SettingGroup(header: "Notification Settings") {
                    SettingToggle(title: "Notify when changes made", isOn: $notifyWhenChangesMade)
                    SettingToggle(title: "Notify when recieved invitation", isOn: $notifyWhenRecievedInvitation)
                    SettingToggle(title: "Instructions, Tipps & Tricks", isOn: $instructionsTippsTricks)
                    SettingToggle(title: "Tutorials", isOn: $tutorials)
                    SettingToggle(title: "Other notifications", isOn: $otherNotifications)
                    SettingToggle(title: "New functions", isOn: $newFunctions)
                    
                    SettingToggle(title: "In-App notifications", isOn: .constant(true))
                    SettingToggle(title: "Updates", isOn: .constant(true))
                }
            }
        }
    }
}

#Preview {
    NotificationSettingsView()
}
