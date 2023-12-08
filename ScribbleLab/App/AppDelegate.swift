//
//  AppDelegate.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 08.12.23.
//

import SwiftUI
import UserNotifications

import FirebaseCore
import GoogleSignIn
import FirebasePerformance

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()

        // Register for remote notifications. This shows a permission dialog on first run, to
        // show the dialog at a more appropriate time move this registration accordingly.
        // [START register_for_notifications]
        UNUserNotificationCenter.current().delegate = self

        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: { _, _ in }
        )
        
        application.registerForRemoteNotifications()
        // [END register_for_notifications]
        
        return true
  }
    
    // The method should call the handleURL method of GIDSignIn instance, which will properly handle the URL that SL recieves at the end of the auth process.
    // [START setting_up_GID]
    @available(iOS 9.0, *)
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
    // [END setting_up_GID]
}
