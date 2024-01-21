//
//  ScribbleLabApp.swift
//  ScribbleLabCore
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
import TipKit

import FirebaseCore
import GoogleSignIn

#if os(iOS)
import FirebasePerformance
#endif

@main
struct ScribbleLabApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    // Check if darkmode is enabled:
    /// A property of type Boolean that stores a boolean value that indicates 
    /// the current state of the applications color scheme:
    /// Possible values:
    /// - false: Dark mode isn't enabled
    /// - true: Dark mode is enabled
    /// 
    /// To call the darkmode state add the @AppStorage property at the top in your Struct
    /// then call the declared isDarkMode argument.
    @AppStorage("isDarkMode") private var isDarkMode = false
    
//    var sceneDelegate: SceneDelegate?
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
                .environmentObject(ContentViewModel())
                .task {
                    try? Tips.resetDatastore()
                    try? Tips.configure([
                        .datastoreLocation(.applicationDefault)
                    ])
                }
            #if os(macOS)
                .frame(width: 500, height: 400)
            #endif
//            SignUpView()
//                .environmentObject(RegistrationViewModel())
//                .environmentObject(SignInWithGoogleModel())
//                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
