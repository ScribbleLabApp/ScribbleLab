//
//  SharedWithYouView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 21.01.24.
//

import SwiftUI

struct SharedWithYouView: View {
    @State private var hasSharedDocuments: Bool = false
    @State private var createDialogDisplayed: Bool = false
    @State private var notificationSheetisPresented: Bool = false
    @State private var settingsViewSheetisPresented: Bool = false
    
    var body: some View {
        VStack {
            if hasSharedDocuments == true {
                Text("HI")
            } else {
                ContentUnavailableView("You have no shared Documents", systemImage: "shared.with.you.slash", description: Text("To share a document, simply tab on 􀈂 or create a shared link."))
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    createDialogDisplayed.toggle()
                } label: {
                    Image(systemName: "plus")
                }
                .confirmationDialog(
                    "How do you like to create a new document?",
                    isPresented: $createDialogDisplayed
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
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "storefront")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    notificationSheetisPresented.toggle()
                } label: {
                    Image(systemName: "bell")
                }
                .sheet(isPresented: $notificationSheetisPresented, content: {
                    NotificationSheetView()
                        .presentationDragIndicator(.visible)
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
        .tint(/*isDarkMode ? .white : .black*/.primary)
        .navigationTitle("Shared with You")
        .navigationBarTitleDisplayMode(.automatic)
    }
}

#Preview {
    SharedWithYouView()
}
