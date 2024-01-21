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
    
//    @AppStorage("isDarkMode") private var isDarkMode = false
    
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
                        ProfileView()
                    } label: {
                        Label("Account", systemImage: "wallet.pass")
                    }
                    Label("Search", systemImage: "magnifyingglass")
                    Label("Trash", systemImage: "trash")
                }
                
                Section("Locations") {
                    // FIXME: Show locations like clouds and sth like that
                    Label("iCloud Drive", systemImage: "icloud") // icloud.square.fill
//                        .symbolRenderingMode(.multicolor)
                    Label("ScribbleCloud", systemImage: "icloud")
                    Label("On this iPad", systemImage: "ipad.gen2")
                }
                
                Section("Tags") {
                    // FIXME: Change color of the tags
                    Label("Red", systemImage: "circle.fill").foregroundStyle(.red)
                    Label("Orange", systemImage: "circle.fill").foregroundStyle(.orange)
                    Label("Yellow", systemImage: "circle.fill").foregroundStyle(.yellow)
                    Label("Green", systemImage: "circle.fill").foregroundStyle(.green)
                    Label("Blue", systemImage: "circle.fill").foregroundStyle(.blue)
                    Label("Purple", systemImage: "circle.fill").foregroundStyle(.purple)
                    Label("Gray", systemImage: "circle.fill").foregroundStyle(.gray)
                }
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Documents")
            .navigationBarTitleDisplayMode(.large)
//            .tint(.orange)
            HomeView()
        }
        .tint(.orange)
        .JMAlert(showModal: $showModal, for: [.camera, .photo, .notification])
        .changeHeaderTo("App Permissions")
    }
}

#Preview {
    SLSideBarView()
}
