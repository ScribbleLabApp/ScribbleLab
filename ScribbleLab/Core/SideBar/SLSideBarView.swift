//
//  SLSideBarView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 07.10.23.
//

import SwiftUI

struct SLSideBarView: View {
    @State private var notificationSheetisPresented = false
    @State private var settingsViewSheetisPresented = false
    // FIXME: Delete this state var when finishing the alpha version
    @State private var newNotification = false
    
    var body: some View {
        NavigationView {
            List {
                Section("Categories") {
                    NavigationLink {
                        HomeView()
                    } label: {
                        Label("Documents", systemImage: "house")
                    }
                    Label("Create", systemImage: "folder.badge.plus")
                    Label("Timetable", systemImage: "calendar.badge.clock")
                    Label("Search", systemImage: "magnifyingglass")
                    Label("Trash", systemImage: "trash")
                }
                
                Section("Locations") {
                    // FIXME: Show locations like clouds and sth like that
                    Label("iCloud Drive", systemImage: "icloud") // icloud.square.fill
//                        .symbolRenderingMode(.multicolor)
                    Label("On this iPad", systemImage: "ipad.gen2")
                }
                
                Section("Tags") {
                    Label("Red", systemImage: "circle.fill")
                    Label("Orange", systemImage: "circle.fill")
                    Label("Yellow", systemImage: "circle.fill")
                    Label("Green", systemImage: "circle.fill")
                    Label("Blue", systemImage: "circle.fill")
                    Label("Purple", systemImage: "circle.fill")
                    Label("Gray", systemImage: "circle.fill")
                }
                
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Documents")
            .navigationBarTitleDisplayMode(.large)
            
//            .toolbar {
//                // FIXME: Show NotificationSheet
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button {
//                        notificationSheetisPresented.toggle()
//                    } label: {
//                        // TODO: Check if the user has new notifications if yes change the icon to "bell.badge"
//                        Image(systemName: newNotification ? "bell.badge" : "bell") // bell.badge
//                    }
//                    .sheet(isPresented: $notificationSheetisPresented, content: {
//                        NotificationSheetView()
//                    })
//                }
//                
//                // FIXME: TODO: Show Settings sheet
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button {
//                        settingsViewSheetisPresented.toggle()
//                    } label: {
//                        Image(systemName: "gearshape")
//                    }
//                    .sheet(isPresented: $settingsViewSheetisPresented, content: {
//                        Text("hi")
//                    })
//                }
//            }
            .tint(.black)
            
            HomeView()
        }
    }
}

#Preview {
    SLSideBarView()
}
