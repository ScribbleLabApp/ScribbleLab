//
//  ScribbleLab_macOSApp.swift
//  ScribbleLab macOS
//
//  Created by Nevio Hirani on 09.05.24.
//

import SwiftUI
import ScribbleCoreServices

@main
struct ScribbleLab_macOSApp: App {
    
    @ObservedObject var coreUpdater = SCNUpdateService.shared
    let subscribedChannel: SCNChannel = .stable
    
    let scnLog = SCNLog(subsystem: "com.nhstudios.ScribbleLab_macOS")
    
    init() {
        scnLog.log("(SCSUpdater): Checking for Updates...")
        
//        coreUpdater.checkForUpdate(channel: subscribedChannel)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            
            if coreUpdater.isUpdateAvailable {
                Text("Hello")
            }
        }
        .commands {
            CommandMenu("Updater") {
                Button("Check for Updates") {
                    coreUpdater.checkForUpdate(channel: subscribedChannel)
                }
            }
        }
    }
}
