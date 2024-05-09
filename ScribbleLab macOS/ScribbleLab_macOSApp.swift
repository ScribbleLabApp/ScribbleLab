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
    
    @StateObject var coreUpdater = SCNUpdateService()
    let subscribedChannel: SCNChannel = .stable
    
    init() {
        coreUpdater.checkForUpdate(channel: subscribedChannel)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
