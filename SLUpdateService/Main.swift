//
//  SLUpdateServiceApp.swift
//  SLUpdateService
//
//  Created by Nevio Hirani on 23.03.24.
//

import SwiftUI
import Sentry

@main
struct SLUpdateServiceApp: App {
    init() {
        SentrySDK.start { options in
            options.dsn = "DNSKEY"
            options.debug = true // Enabled debug when first installing is always helpful
            options.enableTracing = true 

            // Uncomment the following lines to add more data to your events
            // options.attachScreenshot = true // This adds a screenshot to the error events
            // options.attachViewHierarchy = true // This adds the view hierarchy to the error events
        }
        // Remove the next line after confirming that your Sentry integration is working.
        SentrySDK.capture(message: "This app uses Sentry! :)")
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    // Hide close, minimize, and maximize buttons
                    if let window = NSApplication.shared.windows.first {
                        window.standardWindowButton(.closeButton)?.isHidden = true
                        window.standardWindowButton(.miniaturizeButton)?.isHidden = true
                        window.standardWindowButton(.zoomButton)?.isHidden = true
                        window.isMovableByWindowBackground = false
                        window.canHide = false

                        window.maxSize = NSSize(width: 350, height: 400)
                    }
                }
        }
        .windowStyle(.hiddenTitleBar)
    }
}
