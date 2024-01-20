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
        NavigationStack {
            Form {
                Section {
                    Toggle(isOn: $notificationSettings.notificationAllowed) {
                        Text("Allow notifications")
                    }
                    .onChange(of: notificationSettings.notificationAllowed) { newValue in
                        if !newValue {
                            // If notifications are not allowed
                            notificationSettings.notifyWhenChangesMade = false
                            notificationSettings.notifyWhenRecievedInvitation = false
                            notificationSettings.notifyWhenAppUpdates = false
                        } else {
                            notificationSettings.notifyWhenChangesMade = true
                            notificationSettings.notifyWhenRecievedInvitation = true
                            notificationSettings.notifyWhenAppUpdates = true
                        }
                    }
                }
                
                Section {
                    Toggle(isOn: $notificationSettings.notifyWhenChangesMade) {
                        Text("Comments in shared docs")
                    }
                    .disabled(!notificationSettings.notificationAllowed)
                    
                    Toggle(isOn: $notificationSettings.notifyWhenRecievedInvitation) {
                        Text("Invitation to shared docs")
                    }
                    .disabled(!notificationSettings.notificationAllowed)
                    
                    Toggle(isOn: $notificationSettings.notifyWhenAppUpdates) {
                        Text("App Updates & Events")
                    }
                    .disabled(!notificationSettings.notificationAllowed)
                } header: {
                    Text("Notification-Settings")
                } footer: {
                    Text("Select which types of notifications you would like to recieve.")
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
        }
    }
}

#Preview {
    NotificationSettings()
}
