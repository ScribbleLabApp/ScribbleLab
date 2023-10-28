//
//  HomeView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 07.10.23.
//

import SwiftUI
import UserNotifications

struct HomeView: View {
    @State private var notificationSheetisPresented = false
    @State private var settingsViewSheetisPresented = false
    
    @State private var allowNotificationsIsGarnted = false
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            // TODO: Create a list with the notebooks and notes e.g .slnote or .pdf, ... files
            // MARK: File-/Notebook list
            List {
                // MARK: - Pinned documents
                // FIXME: Show cards if no docs are pinned create custom content unavailable view
                Section {
                    Text("Pinned")
                    Text("Hello")
                } header: {
                    Text("Pinned documents")
                } footer: {
                    Text("Here you can find your pinned documents")
                }
                // MARK: - Recently used docs
                Section {
                    HStack {
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "doc")
                                Text("Filename")
                                    .fontWeight(.semibold)
                            }
                            HStack {
                                Image(systemName: "doc")
                                    .foregroundStyle(.clear)
                                Text("2023/10/07 4:38 pm")
                                    .fontWeight(.semibold)
                                    .font(.caption)
                                .foregroundStyle(Color.gray)
                            }
                        }
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                    }
                } header: {
                    Text("Recently opened")
                } footer: {
                    Text("Heres some explaination of it")
                }
                
                // MARK: - All documents, files, folders
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .automatic), prompt: "Search")
            // FIXME: Change back to `.insetGrouped`
            .listStyle(.grouped)
            .navigationTitle("Documents")
//          .navigationBarTitleDisplayMode(.large)
            
            .toolbar {
                // FIXME: Show NotificationSheet
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        notificationSheetisPresented.toggle()
                    } label: {
                        // TODO: Check if the user has new notifications if yes change the icon to "bell.badge"
                        Image(systemName: "bell") // bell.badge
                    }
                    .sheet(isPresented: $notificationSheetisPresented, content: {
                        NotificationSheetView()
                    })
                }
                
                // FIXME: TODO: Show Settings sheet
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        settingsViewSheetisPresented.toggle()
                    } label: {
                        Image(systemName: "gearshape")
                    }
                    .sheet(isPresented: $settingsViewSheetisPresented, content: {
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
//                if granted == granted {
//                    self.allowNotificationsIsGarnted.toggle()
//                }
                // Provisional authorization granted.
            }
        }
    }
}

#Preview {
    HomeView()
}
