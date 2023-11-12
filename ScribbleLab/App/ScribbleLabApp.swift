//
//  ScribbleLabApp.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 06.10.23.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn

/// An App Delegate that is responsible for the Firebase configuration and GIDSignIn
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

    // Check if darkmode is enabled:
    /// A property of type Boolean that stores a boolean value that indicates the current state of the applications color scheme
    /// Possible values:
    /// - false: Dark mode isn't enabled
    /// - true: Dark mode is enabled
    /// 
    /// To call the darkmode state add the @AppStorage property at the top in your Struct
    /// then call the declared isDarkMode argument.
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ContentViewModel())
//            SignUpView()
//                .environmentObject(RegistrationViewModel())
//                .environmentObject(SignInWithGoogleModel())
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
        
        /// Checks if current OS is macOS
        #if os(macOS)
        ContentView()
            .environmentObject(ContentViewModel())
            .preferredColorScheme(isDarkMode ? .dark : .light)
            .frame(minWidth: 700, minHeight: 300)
        #endif
    }
}
