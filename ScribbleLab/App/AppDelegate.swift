//===------------------------------ScribbleLabCore-AppDelegate------------------------------===//
//                                                                                             //
//  AppDelegate.swift                                                                          //
//  ScribbleLabCore                                                                            //
//                                                                                             //
//  Copyright (c) 2023 - 2024 ScribbleLabApp.                                                  //
//                                                                                             //
//  Licensed under the Apache License, Version 2.0 (the "License");                            //
//  you may not use this file except in compliance with the License.                           //
//  You may obtain a copy of the License at                                                    //
//                                                                                             //
//       http://www.apache.org/licenses/LICENSE-2.0                                            //
//                                                                                             //
//  Unless required by applicable law or agreed to in writing, software                        //
//  distributed under the License is distributed on an "AS IS" BASIS,                          //
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.                   //
//  See the License for the specific language governing permissions and                        //
//  limitations under the License.                                                             //
//                                                                                             //
// See https://github.com/ScribbleLabApp/ScribbleLab/blob/main/LICENSE for license information //
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors                //
//                                                                                             //
//===---------------------------------------------------------------------------------------===//
//                                                                                             //
// This file contains settings and implementations for ScribbleLab Client and                  //
// ScribbleLab's DB.                                                                           //
//                                                                                             //
//===---------------------------------------------------------------------------------------===//

#if os(iOS)
import UIKit
import SwiftUI
import UserNotifications
import os.log

import FirebaseCore
import GoogleSignIn
import FirebasePerformance
import FirebaseCrashlytics

#elseif os(macOS)
import AppKit
import SwiftUI
import UserNotifications
import os.log

import FirebaseCore
import GoogleSignIn
#endif

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    var notificationSettings = NotificationSettingsModel()
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        FirebaseApp.configure()
        
        // Register for remote notifications. This shows a permission dialog on first run, to
        // show the dialog at a more appropriate time move this registration accordingly.
        // [START register_for_notifications]
        UNUserNotificationCenter.current().delegate = self

        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: { granted, _ in
                self.notificationSettings.notificationAllowed = granted
            }
        )
        
        application.registerForRemoteNotifications()
        // [END register_for_notifications]
        
        // [START setting_up_an_exeption_handler]
        NSSetUncaughtExceptionHandler { exception in
            Crashlytics.crashlytics().record(error: exception as! NSError)
        }
        // [END setting_up_an_exeption_handler]
        
        return true
    }
    
    private let logger = Logger(subsystem: "com.nhstudios.ScribbleLab", category: "MemoryWarning")
    
    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        logger.error("MEMORY ISSUE: Received memory warning!")
    }
    
    // The method should call the handleURL method of GIDSignIn instance, 
    // which will properly handle the URL that SL recieves at the end of the auth process.
    // [START setting_up_GID]
    
    @available(iOS 9.0, *)
    func application(_ application: UIApplication,
                     open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
    // [END setting_up_GID]
}
