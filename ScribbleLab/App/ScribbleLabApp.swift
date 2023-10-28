//
//  ScribbleLabApp.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 06.10.23.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
    
    // The method should call the handleURL method of GIDSignIn instance, which will properly handle the URL that SL recieves at the end of the auth process.
    @available(iOS 9.0, *)
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
}

@main
struct ScribbleLabApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    // Check if darkmode is enabled
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ContentViewModel())
                .environmentObject(RegistrationViewModel())
//            SignUpView()
//                .environmentObject(SignInWithGoogleModel())
//                .environmentObject(RegistrationViewModel())
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
