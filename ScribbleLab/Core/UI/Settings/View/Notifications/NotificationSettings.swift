//
//  NotificationSettings.swift
//  ScribbleLabCore iOS Lab
//
//  Copyright (c) 2023 - 2024 ScribbleLabApp.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import SwiftUI

struct NotificationSettings: View {
    @ObservedObject var notificationSettings = NotificationSettingsModel()
    
    var body: some View {
        Form {
            Section {
                Toggle(isOn: $notificationSettings.notificationAllowed) {
                    Text("Allow notifications")
                }
                .onChange(of: notificationSettings.notificationAllowed) { newValue in
                    if !newValue {
                        // If notifications are not allowed
                        notificationSettings.notifyWhenChangesMade = true
                        notificationSettings.notifyWhenRecievedInvitation = true
                        notificationSettings.newFunctions = true
                        notificationSettings.instructionsTippsTricks = true
                        notificationSettings.tutorials = true
                        notificationSettings.notifyWhenAppUpdates = true
                        notificationSettings.otherNotifications = true
                        notificationSettings.inAppNotifications = true
                    } else {
                        notificationSettings.notifyWhenChangesMade = true
                        notificationSettings.notifyWhenRecievedInvitation = true
                        notificationSettings.newFunctions = true
                        notificationSettings.instructionsTippsTricks = true
                        notificationSettings.tutorials = true
                        notificationSettings.notifyWhenAppUpdates = true
                        notificationSettings.otherNotifications = true
                        notificationSettings.inAppNotifications = true
                    }
                }
            } footer: {
                Text("Stay up to date with push notifications.")
            }
            
            Section {
                Toggle(isOn: $notificationSettings.newFunctions) {
                    Text("New functions")
                }
                .disabled(!notificationSettings.notificationAllowed)
                
                Toggle(isOn: $notificationSettings.instructionsTippsTricks) {
                    Text("Instructions, tips and tricks")
                }
                .disabled(!notificationSettings.notificationAllowed)
                
                Toggle(isOn: $notificationSettings.tutorials) {
                    Text("Tutorials and articles")
                }
                .disabled(!notificationSettings.notificationAllowed)
                
                Toggle(isOn: $notificationSettings.notifyWhenAppUpdates) {
                    Text("App Updates & Events")
                }
                .disabled(!notificationSettings.notificationAllowed)
                
                Toggle(isOn: $notificationSettings.otherNotifications) {
                    Text("Other marketing notifications")
                }
                .disabled(!notificationSettings.notificationAllowed)
                
                Toggle(isOn: $notificationSettings.notifyWhenChangesMade) {
                    Text("Comments in shared docs")
                }
                .disabled(!notificationSettings.notificationAllowed)
                
                Toggle(isOn: $notificationSettings.notifyWhenRecievedInvitation) {
                    Text("Invitation to shared docs")
                }
                .disabled(!notificationSettings.notificationAllowed)
            } header: {
                Text("Notification-Settings")
            } footer: {
                Text("Choose which topics you would like to receive notifications about.")
            }
            
            Section {
                NavigationLink {
                    NewsletterSettingsView()
                } label: {
                    Text("Newsletter-Settings")
                }
            } footer: {
                Text("Select which newsletter emails you'd like to recieve. You can unsubscribe everytime from our [newsletter](https://github.com/ScribbleLabApp/ScribbleLab).")
            }
            
            Section {
                Toggle("Allow In-App Notifications", isOn: $notificationSettings.inAppNotifications)
                    .disabled(!notificationSettings.notificationAllowed)
            } header: {
                Text("Messages")
            } footer: {
                Text("Get practical tips on features and more directly in ScribbleLab.")
            }
            
            Section {
                Button {
                    notificationSettings.resetNotificationSettings()
                } label: {
                    Text("Reset Notification Settings")
                        .foregroundStyle(.red)
                }
                .disabled(!notificationSettings.notificationAllowed)
            } footer: {
                Text("This option resets all customized settings to the factory standard. This option can't be undone and all customized settings will be reseted forever.")
            }
        }
        .navigationTitle("Notifications")
        .navigationBarTitleDisplayMode(.inline)
        .tint(.orange)
    }
}

#Preview {
    NavigationStack {
        NotificationSettings()
    }
}
