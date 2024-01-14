//
//  HomeView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 07.10.23.
//

import SwiftUI
import TipKit
import UserNotifications

struct HomeView: View {
    @StateObject var viewModifier = HomeViewModel()
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    // [START dev_properties_test]
    @State private var documentsAvailable = false
    // [END dev_properties_test]
     
    // [START create_shared_instance_of_tip]
    let createFirstDocumentTip = CreateNewDocumentTip()
    let showNotificationTip = ShowNotificationsTip()
    // [END create_shared_instance_of_tip]
        
    var body: some View {
        NavigationStack {
            VStack {
                if documentsAvailable == true {
                    Text("Hi")
                } else {
                    ContentUnavailableView("You have no documents", systemImage: "doc.viewfinder.fill")
                }
            }
            .navigationTitle("Documents")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        Task { await CreateNewDocumentTip.createNewDocumentEvent.donate() }
                        viewModifier.createDialogDisplayed.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .confirmationDialog(
                        "How do you like to create a new document?",
                        isPresented: $viewModifier.createDialogDisplayed
                    ) {
                        Button("Scan document") {
                            print("DEBUG: Scan document")
                        }
                        Button("Create from Template") {
                           print("DEBUG: Create new document from Templates")
                        }
                    } message: {
                        Text("Select how you'd like to create a new document.")
                    }
                    .popoverTip(createFirstDocumentTip)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        Task { /* TODO: Store tip */ }
                    } label: {
                        Image(systemName: "storefront")
                    }
                    /* .popoverTip(createFirstDocumentTip) */
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModifier.notificationSheetisPresented.toggle()
                        Task {
                            await ShowNotificationsTip.visitNotificationViewEvent.donate()
                        }
                        viewModifier.newNotification.toggle()
                    } label: {
                        Image(systemName: viewModifier.newNotification ? "bell.badge" : "bell")
                    }
                    .popoverTip(showNotificationTip)
                    .sheet(isPresented: $viewModifier.notificationSheetisPresented, content: {
                        NotificationSheetView()
                            .presentationDragIndicator(.visible)
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
        .onAppear {
            Task {
                await CreateNewDocumentTip.launchHomeScreenEvent.donate()
                await ShowNotificationsTip.launchHomeScreenEvent.donate()
            }
        }
    }
}

#Preview {
    HomeView()
        .task {
//            try? Tips.resetDatastore()
            try? Tips.configure([
                .datastoreLocation(.applicationDefault)
            ])
        }
}
