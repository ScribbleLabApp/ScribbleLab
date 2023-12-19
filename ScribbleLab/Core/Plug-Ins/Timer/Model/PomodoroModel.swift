//
//  PomodoroModel.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 15.10.23.
//

import SwiftUI

class PomodoroModel: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    // MARK: - Timer properties
    @Published var progress: CGFloat = 1
    @Published var timerStringValue: String = "00:00"
    @Published var estimatedFinishedTime: String = ""
    @Published var isStarted: Bool = false
    @Published var addNewTimer: Bool = false
    
    @Published var hour: Int = 0
    @Published var minutes: Int = 0
    @Published var seconds: Int = 0
    
    // MARK: - Total Seconds
    @Published var totalSeconds: Int = 0
    @Published var staticTotalSeconds: Int = 0
    
    // MARK: - Post Timer Properties
    @Published var isFinished: Bool = false
    
    // NS Object stuff
    override init() {
        super.init()
        self.authorizeNotifications()
    }
    
    // MARK: - Authorize Notifications
    // swiftlint:disable line_length
    func authorizeNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.sound, .alert, .badge, .provisional, .criticalAlert]) { _, _ in
            
        }
        
        // MARK: In-app notification
        UNUserNotificationCenter.current().delegate = self
    }
    // swiftlint:enable line_length
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.sound, .banner])
    }
    // MARK: - Start Timer
    func startTimer() {
        withAnimation(.easeInOut(duration: 0.25)) { isStarted = true }
        // MARK: Time String Value
        timerStringValue = "\(hour == 0 ? "" : "\(hour):")\(minutes >= 10 ? "\(minutes)" : "0\(minutes)"):\(seconds>=10 ? "\(seconds)" : "0\(seconds)")"
        // MARK: Calculate Total Seconds
        /// 1 hour = 3600 sec · 1 min = 60 sec
        totalSeconds = (hour * 3600) + (minutes * 60) + seconds
        staticTotalSeconds = totalSeconds
        addNewTimer = false
        notifyWhenTimerEnds()
    }
    // MARK: - Stop Timer
    func stopTimer() {
        withAnimation {
            isStarted = false
            hour = 0
            minutes = 0
            seconds = 0
            progress = 1
        }
        totalSeconds = 0
        staticTotalSeconds = 0
        timerStringValue = "00:00"
    }
    
    // MARK: - Update Timer
    func upadateTimer() {
        totalSeconds -= 1
        progress = CGFloat(totalSeconds) / CGFloat(staticTotalSeconds)
        progress = (progress < 0 ? 0 : progress)
        // 60 min * 60 sec
        // 1 hr = 3600 sec
        hour = totalSeconds / 3600
        minutes = (totalSeconds / 60) % 60
        seconds = (totalSeconds % 60)
        
        timerStringValue = "\(hour == 0 ? "" : "\(hour):")\(minutes >= 10 ? "\(minutes)" : "0\(minutes)"):\(seconds>=10 ? "\(seconds)" : "0\(seconds)")"
        
        if hour == 0 && seconds == 0 && minutes == 0 {
            isStarted = false
            print("DEBUG: Finished")
            isFinished = true
        }
    }
    
    // MARK: notification
    /// A function that returns an push notification
    ///
    /// To configure the push notification's payload, the `UNMutableNotificationContent()` function has to be called.
    /// - `content.title`: The notification's title
    /// - `content.body`: The notification's description Text
    /// - `contnet.sound`: The notification's sound
    ///
    /// To make the text localozable a `NSString.localizedUserNotificationString(forKey: "key", arguments: nil)` has to be used
    ///
    /// Delivering a notification:
    /// - `let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)`: Trigger's the notification to deliver within 1 second `timeInterval: 1`.
    /// - `let request = UNNotificationRequest(identifier: "MSG", content: content, trigger: trigger)`: Schedule the notification with the notification's payload and it's trigger
    /// - `let center = UNUserNotificationCenter.current()`
    ///
    func notifyWhenTimerEnds() {
        // Configure the notification's payload.
        let content = UNMutableNotificationContent()
        content.title = NSString.localizedUserNotificationString(forKey: "ScribbleLab", arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: "Your study timer has expired 🎉", arguments: nil)
        content.sound = UNNotificationSound.default
        
        // Deliver the notification in five seconds.
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(staticTotalSeconds), repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger) // Schedule the notification.
        let center = UNUserNotificationCenter.current()
        center.add(request) { (error : Error?) in
            if error != nil {
                 // Handle any errors
            }
        }
    }
    
    // MARK: Calculate estimated finish time
    /// A function that calculates the estimated finish time
    ///
    func getCurrentTime() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "mm:ss"
            return dateFormatter.string(from: Date())
    }
    
    func calculateEstimatedTime() {
        
    }
    // swiftlint:enable line_length
}
