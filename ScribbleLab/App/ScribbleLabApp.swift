// ===------------------------------ScribbleLabCore-Entry-Point------------------------------=== //
//                                                                                               //
//  ScribbleLabApp.swift                                                                         //
//  ScribbleLabCore                                                                              //
//                                                                                               //
//  Copyright (c) 2023 - 2024 ScribbleLabApp.                                                    //
//                                                                                               //
//  Licensed under the Apache License, Version 2.0 (the "License");                              //
//  you may not use this file except in compliance with the License.                             //
//  You may obtain a copy of the License at                                                      //
//                                                                                               //
//       http://www.apache.org/licenses/LICENSE-2.0                                              //
//                                                                                               //
//  Unless required by applicable law or agreed to in writing, software                          //
//  distributed under the License is distributed on an "AS IS" BASIS,                            //
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.                     //
//  See the License for the specific language governing permissions and                          //
//  limitations under the License.                                                               //
//                                                                                               //
// See https://github.com/ScribbleLabApp/ScribbleLab/blob/main/LICENSE for license information   //
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors                  //
//                                                                                               //
// ===---------------------------------------------------------------------------------------=== //
//                                                                                               //
// This file declares the app's main entry point and contains configurations                     //
// for ScribbleLab's Views                                                                       //
//                                                                                               //
// ===---------------------------------------------------------------------------------------=== //

import SwiftUI
import TipKit

import FirebaseCore
import GoogleSignIn

import AppearanceProviding

#if os(iOS)
import FirebasePerformance
import FirebaseCrashlytics
#endif

@main
struct ScribbleLabApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ContentViewModel())
                .task {
                    try? Tips.resetDatastore()
                    try? Tips.configure([
                        .datastoreLocation(.applicationDefault)
                    ])
                }
                .setAppearance()
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
