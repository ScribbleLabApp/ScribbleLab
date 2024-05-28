//
//  SearchView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 22.01.24.
//

import SwiftUI

struct SearchView: View {
    @State private var sortOption = DocumentSortOptionFavourite.date
    @State var displayStyle: SortOption = .symbols
    
    @State private var notificationSheetisPresented: Bool = false
    @State private var settingsViewSheetisPresented: Bool = false
    @State private var createDialogDisplayed: Bool = false
    
    @State private var searchText = ""
    @State private var searchIsActive = false
    
    var body: some View {
        VStack {
            Divider()
            
            HStack {
                Spacer()
                
                SegmentedPicker(selection: $sortOption)
                    .padding(.horizontal)

                Spacer()
                
                HStack {
                    Button {
                        print("DEBUG: Select documents")
                    } label: {
                        Image(systemName: "checkmark.circle")
                            .foregroundStyle(.orange)
                    }
                    .padding(.horizontal)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "trash")
                    }
                    .padding(.horizontal)
                    
                    SLDisplayStyleButton(displayStyle: $displayStyle)
                        .padding(.horizontal)
                }
                .tint(.orange)
            }
            .padding()
            
            ContentUnavailableView("No documents found", systemImage: "magnifyingglass", description: Text("Try again."))
                .searchable(text: $searchText, isPresented: $searchIsActive, prompt: "Search for your Documents")
        }
//        .searchable(text: $searchText, isPresented: $searchIsActive, prompt: "Search for your Documents")
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
        .navigationTitle("Search")
        .navigationBarTitleDisplayMode(.automatic)
    }
}

#Preview {
    SearchView()
}
