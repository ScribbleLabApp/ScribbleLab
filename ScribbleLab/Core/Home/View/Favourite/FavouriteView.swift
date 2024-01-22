//
//  FavouriteView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 21.01.24.
//

import SwiftUI

struct FavouriteView: View {
    @State private var hasStarredDocuments: Bool = false
    @State private var createDialogDisplayed: Bool = false
    @State private var notificationSheetisPresented: Bool = false
    @State private var settingsViewSheetisPresented: Bool = false
    
    @State private var sortOption: DocumentSortOptionFavourite = .date
    
    var body: some View {
        VStack {
            Divider()
            
            HStack {
                Spacer()
                
                SegmentedPicker(selection: $sortOption)
                    .padding(.horizontal)
                
                Spacer()
                
                Button {
                    print("DEBUG: Select documents")
                } label: {
                    Image(systemName: "checkmark.circle")
                        .foregroundStyle(.orange)
                }
                .padding(.horizontal)
            }
            .padding()
            
            ContentUnavailableView("You have no starred Documents", systemImage: "star.slash", description: Text("To star a document, press the 􀊴 Button."))
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
        .navigationTitle("Favourite")
        .navigationBarTitleDisplayMode(.automatic)
    }
}

#Preview {
    NavigationStack {
        FavouriteView()
    }
}
