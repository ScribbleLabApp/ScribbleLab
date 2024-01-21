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
    // MARK: Permission Modal sheet
    @State private var showModal = false
    
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
                        FavouriteView()
                    } label: {
                        Label("Favourite", systemImage: "star")
                    }
                    NavigationLink {
                        SharedWithYouView()
                    } label: {
                        Label("Shared with You", systemImage: "shared.with.you")
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
                    NavigationLink {
                        
                    } label: {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                    NavigationLink {
                        
                    } label: {
                        Label("Trash", systemImage: "trash")
                    }
                }
                
                Section("Locations") {
                    Label("iCloud Drive", systemImage: "icloud")
                    Label("ScribbleCloud", systemImage: "icloud")
                    Label("GoogleDrive", systemImage: "icloud")
                    Label("Dropbox", systemImage: "icloud")
                    Label("On this iPad", systemImage: "ipad.gen2")
                }
                
                Section("Tags") {
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
            .navigationTitle("ScribbleLab")
            .navigationBarTitleDisplayMode(.large)
            
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
