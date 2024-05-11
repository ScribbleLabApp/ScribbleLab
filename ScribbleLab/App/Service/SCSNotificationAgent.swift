//
//  SCSNotificationAgent.swift
//  ScribbleLab Core
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
//  Authors:
//  - NH: https://github.com/N3v1
//

import SwiftUI
import UserNotifications
import ScribbleCoreServices

// NotificationAgent manages notification permissions and settings.
//
// NotificationAgent is a singleton class that provides functionality to check and request notification permissions,
// as well as monitor notification settings. It conforms to ObservableObject and UNUserNotificationCenterDelegate protocols.
//
//  ```swift
//  // Request notification permission
//  NotificationAgent.shared.requestNotificationPermission()
//  ```
//
class NotificationAgent: NSObject, ObservableObject, UNUserNotificationCenterDelegate, SCSNotificationAgent {
    
    // The shared instance of NotificationAgent.
    static let shared = NotificationAgent()
    
    // The current notification permission status.
    @Published var notificationPermissionStatus: UNAuthorizationStatus = .notDetermined
    
    // Initializes a new instance of NotificationAgent.
    //
    // This method sets the delegate of the UNUserNotificationCenter to the instance of NotificationAgent
    // and checks the current notification permission status.
    private override init() {
        super.init()
        UNUserNotificationCenter.current().delegate = self
        checkNotificationPermissionStatus()
    }
    
    // Requests notification permission from the user.
    //
    // This method requests authorization to display alerts, badges, and play sounds for notifications.
    // Upon user response, it updates the notificationPermissionStatus accordingly.
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { [weak self] granted, error in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if granted {
                    self.notificationPermissionStatus = .authorized
                } else {
                    self.notificationPermissionStatus = .denied
                }
            }
        }
    }
    
    // Checks the current notification permission status.
    //
    // This method retrieves the notification settings and updates the notificationPermissionStatus accordingly.
    private func checkNotificationPermissionStatus() {
        UNUserNotificationCenter.current().getNotificationSettings { [weak self] settings in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.notificationPermissionStatus = settings.authorizationStatus
            }
        }
    }
}
