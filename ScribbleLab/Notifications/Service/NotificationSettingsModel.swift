//
//  NotificationSettings.swift
//  ScribbleLab
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

public class NotificationSettingsModel: ObservableObject {
    @Published var notificationAllowed: Bool = false
    
    @Published var notifyWhenChangesMade: Bool = false // true
    @Published var notifyWhenRecievedInvitation: Bool = false // true
    @Published var newFunctions: Bool = false
    @Published var instructionsTippsTricks: Bool = false
    @Published var tutorials: Bool = false
    @Published var notifyWhenAppUpdates: Bool = false // true
    @Published var otherNotifications: Bool = false
    
    @Published var inAppNotifications: Bool = false
    
    func resetNotificationSettings() {
        notifyWhenChangesMade = true
        notifyWhenRecievedInvitation = true
        newFunctions = true
        instructionsTippsTricks = true
        tutorials = true
        notifyWhenAppUpdates = true
        otherNotifications = true
        inAppNotifications = true
    }
}
