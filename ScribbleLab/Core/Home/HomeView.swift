//
//  HomeView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 07.10.23.
//

import SwiftUI

struct HomeView: View {
    @State private var notificationSheetisPresented = false
    @State private var settingsViewSheetisPresented = false
    // FIXME: Delete this state var when finishing the alpha version
    @State private var newNotification = false
    
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
            // FIXME: Change back to `.insetGrouped`
            .listStyle(.grouped)
            
                .navigationTitle("Documents")
//                .navigationBarTitleDisplayMode(.large)
            
                .toolbar {
                    // FIXME: Show NotificationSheet
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            notificationSheetisPresented.toggle()
                        } label: {
                            // TODO: Check if the user has new notifications if yes change the icon to "bell.badge"
                            Image(systemName: newNotification ? "bell.badge" : "bell") // bell.badge
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
                            Text("hi")
                        })
                    }
                }
                .tint(.black)
            
        }
    }
}

#Preview {
    HomeView()
}
