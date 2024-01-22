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
     
    // [START create_shared_instance_of_tip]
    let createFirstDocumentTip = CreateNewDocumentTip()
    let showNotificationTip = ShowNotificationsTip()
    // [END create_shared_instance_of_tip]
    
    var body: some View {
        VStack {
            Divider()
            
            ContentUnavailableView("You have no documents", systemImage: "doc.viewfinder.fill")
        }
        .navigationTitle("Documents")
//        .tint(.primary)
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
//        .tint(.orange)
        .tint(.primary)
        .onAppear {
            Task {
                await CreateNewDocumentTip.launchHomeScreenEvent.donate()
                await ShowNotificationsTip.launchHomeScreenEvent.donate()
            }
        }
    }
}

#Preview {
    NavigationStack {
        HomeView()
            .task {
                try? Tips.resetDatastore()
                try? Tips.configure([
                    .datastoreLocation(.applicationDefault)
                ])
            }
    }
}
