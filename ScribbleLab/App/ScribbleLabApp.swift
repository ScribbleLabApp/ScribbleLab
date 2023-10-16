//
//  ScribbleLabApp.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 06.10.23.
//

import SwiftUI

@main
struct ScribbleLabApp: App {
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
