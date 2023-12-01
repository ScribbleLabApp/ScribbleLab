//
//  HomeView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 07.10.23.
//

import SwiftUI
import UserNotifications

struct HomeView: View {
    @StateObject var viewModifier = HomeViewModel()
    @AppStorage("isDarkMode") private var isDarkMode = false
        
    var body: some View {
        NavigationStack {
            Text("Hi")

            .navigationTitle("Documents")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("DEBUG: create doc")
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModifier.notificationSheetisPresented.toggle()
                    } label: {
                        // TODO: Check if the user has new notifications if yes change the icon to "bell.badge"
                        Image(systemName: "bell") // bell.badge
                    }
                    .sheet(isPresented: $viewModifier.notificationSheetisPresented, content: {
                        NotificationSheetView()
                    })
                }
                
                // FIXME: TODO: Show Settings sheet
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModifier.settingsViewSheetisPresented.toggle()
                    } label: {
                        Image(systemName: "gearshape")
                    }
                    .sheet(isPresented: $viewModifier.settingsViewSheetisPresented, content: {
                        SLSettingsView()
                    })
                }
            }
            .tint(isDarkMode ? .white : .black)
        }
        
        // FIXME: Fix notification alert
        .onAppear {
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options: [.alert, .sound, .badge, .provisional, .criticalAlert]) { granted, error in
                
                if let error = error {
                    // Handle the error here.
                    print("DEBUG:\(error.localizedDescription).")
                }
                
                // FIXME: Rework this
                if granted == granted {
                    self.viewModifier.allowNotificationsIsGarnted.toggle()
                }
                // Provisional authorization granted.
            }
        }
    }
}

#Preview {
    HomeView()
}
