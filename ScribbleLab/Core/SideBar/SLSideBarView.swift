//
//  SLSideBarView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 07.10.23.
//

import SwiftUI
import PermissionsSwiftUIPhoto
import PermissionsSwiftUICamera
import PermissionsSwiftUINotification

struct SLSideBarView: View {
    @State private var notificationSheetisPresented = false
    @State private var settingsViewSheetisPresented = false
    // FIXME: Delete this state var when finishing the alpha version
    @State private var newNotification = false
    
    // MARK: Permission Modal sheet
    @State private var showModal = false
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        NavigationView {
            List {
                Section("Categories") {
                    NavigationLink {
                        HomeView()
                    } label: {
                        Label("Documents", systemImage: "house")
                    }
                    NavigationLink {
                        SLShopMainView()
                    } label: {
                        Label("Store", systemImage: "storefront")
                    }
                    NavigationLink {
                        
                    } label: {
                        Label("Timetable", systemImage: "calendar.badge.clock")
                    }
                    NavigationLink {
                        
                    } label: {
                        Label("Calender", systemImage: "calendar")
                    }
                    NavigationLink {
                        SLStudyPomodoroTimerView()
                            .environmentObject(PomodoroModel())
                    } label: {
                        Label("Study Timer", systemImage: "timer")
                    }
                    Label("Reminder", systemImage: "exclamationmark.bubble")
                    Label("Homework", systemImage: "doc.text")
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
                    // FIXME: Change color of the tags
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
            .tint(.black)
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
            .tint(isDarkMode ? .white : .black)
            
            HomeView()
        }
        .JMAlert(showModal: $showModal, for: [.camera, .photo, .notification])
        .changeHeaderTo("App Permissions")
    }
}

#Preview {
    SLSideBarView()
}
