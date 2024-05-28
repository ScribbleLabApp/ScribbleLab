//
//  SCSNotificationService.swift
//  ScribbleLab Notifications Service
//
//  Copyright (c) 2024 ScribbleLabApp. All rights reserved
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

import Foundation
import UserNotifications
import NotificationCenter
import ScribbleCoreServices

/// Protocol defining the interface for notification agent.
///
/// The `SCSNotificationAgent` protocol provides an interface for handling
/// notification permissions. It includes a property to track the current notification
/// permission status and a method to request notification permissions from the user.
internal protocol SCSNotificationAgent: AnyObject {
    
    /// The current notification permission status.
    var notificationPermissionStatus: UNAuthorizationStatus { get set }
    
    /// Requests notification permission from the user.
    ///
    /// This method prompts the user to grant permission for the app to send notifications.
    /// It updates the `notificationPermissionStatus` property based on the user's response.
    func requestNotificationPermission()
}

/// Service class for handling user notifications.
///
/// The `SCSNotificationService` class is responsible for managing user notifications
/// in the app. It conforms to the `SCSNotificationAgent` protocol and the `UNUserNotificationCenterDelegate`
/// protocol to handle notification permissions, scheduling notifications, and responding to
/// notification events.
///
///     // Access the shared instance of SCSNotificationService
///     let notificationService = SCSNotificationService.shared
///
///     // Check the current notification permission status
///     notificationService.checkNotificationPermissionStatus()
///
///     // Request notification permission from the user
///     notificationService.requestNotificationPermission()
///
///     // Schedule a notification to be delivered in 5 seconds
///     notificationService.scheduleNotification(
///         title: "Test Notification",
///         body: "This is a test notification.",
///         timeInterval: 5
///     )
///
///     // Check if notifications are authorized
///     if notificationService.isNotificationAuthorized {
///         print("Notifications are authorized.")
///     } else {
///         print("Notifications are not authorized.")
///     }
///
class SCSNotificationService: NSObject, SCSNotificationAgent, UNUserNotificationCenterDelegate {
    
    /// Shared instance of `SCSNotificationService`.
    ///
    /// The shared instance provides a singleton access point for the `SCSNotificationService` class,
    /// ensuring that notification handling is managed centrally within the app.
    static let shared = SCSNotificationService()
    
    /// The current notification permission status.
    var notificationPermissionStatus: UNAuthorizationStatus = .notDetermined {
        didSet {
            saveNotificationPermissionStatus()
        }
    }
    
    /// Initializes a new instance of `SCSNotificationService`.
    ///
    /// This initializer sets the current instance as the delegate for `UNUserNotificationCenter`
    /// and checks the current notification permission status.
    override init() {
        super.init()
        UNUserNotificationCenter.current().delegate = self
        notificationPermissionStatus = loadNotificationPermissionStatus()
        checkNotificationPermissionStatus()
    }
    
    /// Checks the current notification permission status.
    ///
    /// This method retrieves the current notification settings and updates the
    /// `notificationPermissionStatus` property accordingly. It ensures that the status is
    /// updated on the main thread to avoid threading issues.
    func checkNotificationPermissionStatus() {
        DispatchQueue.main.async {
            UNUserNotificationCenter.current().getNotificationSettings { settings in
                self.notificationPermissionStatus = settings.authorizationStatus
            }
        }
    }
    
    /// Requests notification permission from the user.
    ///
    /// This method prompts the user to grant permission for the app to send notifications.
    /// It updates the `notificationPermissionStatus` property based on the user's response.
    /// If an error occurs during the request, it logs the error using `SCNLoggingAgent`.
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(
            options: [.alert, .sound, .criticalAlert, .badge, .provisional]
        ) { granted, error in
            if granted {
                self.notificationPermissionStatus = .authorized
            } else if let error = error {
                SCNLoggingAgent.shared.logger.error("Error requesting notification permission: \(error)")
                self.notificationPermissionStatus = .denied
            } else {
                self.notificationPermissionStatus = .denied
            }
        }
    }
    
    /// Schedules a notification to be delivered after a specified time interval.
    /// - Parameters:
    ///   - title: The title of the notification.
    ///   - body: The body text of the notification.
    ///   - timeInterval: The time interval after which the notification should be delivered.
    ///
    /// This method creates a new notification with the specified title and body,
    /// and schedules it to be delivered after the given time interval. It logs any errors
    /// encountered during the scheduling process.
    func scheduleNotification(title: String, body: String, timeInterval: TimeInterval) {
        let content = UNMutableNotificationContent()
        
        content.title = title
        content.body = body
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                SCNLoggingAgent.shared.logger.error("Error scheduling notification: \(error)")
            }
        }
    }
    
    /// A boolean value indicating whether notifications are authorized.
    ///
    /// This computed property returns `true` if the notification permission status
    /// is either `.authorized` or `.provisional`, indicating that the user has granted permission
    /// for the app to send notifications.
    var isNotificationAuthorized: Bool {
        return notificationPermissionStatus == .authorized || notificationPermissionStatus == .provisional
    }
    
    /// Saves the current notification permission status to UserDefaults.
    private func saveNotificationPermissionStatus() {
        UserDefaults.standard.set(notificationPermissionStatus.rawValue, forKey: "notificationPermissionStatus")
    }
    
    /// Loads the notification permission status from UserDefaults.
    /// - Returns: The loaded `UNAuthorizationStatus`.
    private func loadNotificationPermissionStatus() -> UNAuthorizationStatus {
        let rawValue = UserDefaults.standard.integer(forKey: "notificationPermissionStatus")
        return UNAuthorizationStatus(rawValue: rawValue) ?? .notDetermined
    }
    
    /// Toggles the notification permission status locally and updates the settings.
    /// - Parameter isEnabled: A boolean indicating whether notifications are enabled.
    ///
    /// This method allows toggling the notification permission status locally and updates
    /// the settings accordingly. If notifications are disabled, it updates the status to `.denied`.
    /// If notifications are enabled, it requests authorization again.
    func toggleNotificationPermission(isEnabled: Bool) {
        if isEnabled {
            requestNotificationPermission()
        } else {
            notificationPermissionStatus = .denied
        }
    }
}

// MARK: - UNUserNotificationCenterDelegate

extension SCSNotificationService {
    /// Called when a notification is delivered to a foreground app.
    /// - Parameters:
    ///   - center: The notification center that received the notification.
    ///   - notification: The notification that is about to be delivered.
    ///   - completionHandler: The block to execute with the presentation options for the notification.
    ///
    /// This method is called when a notification is delivered to the app while it is
    /// in the foreground. It specifies how the notification should be presented (e.g., alert, sound, badge).
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        completionHandler([.alert, .sound, .badge])
    }
    
    /// Called to let your app know which action was selected by the user for a given notification.
    /// - Parameters:
    ///   - center: The notification center that received the notification.
    ///   - response: The user’s response to the notification.
    ///   - completionHandler: The block to execute when you have finished processing the user’s response.
    ///
    /// This method is called when the user interacts with a notification (e.g., by tapping
    /// on it or choosing an action). It provides an opportunity to handle the user's response and
    /// perform any necessary actions.
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void
    ) {
        completionHandler()
    }
}

// MARK: - Notification Type

extension SCSNotificationService {
    
}
