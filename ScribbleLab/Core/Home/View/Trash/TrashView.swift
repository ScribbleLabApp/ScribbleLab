//
//  TrashView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 22.01.24.
//

import SwiftUI

struct TrashView: View {
    @State private var sortOption = DocumentSortOptionFavourite.date
    
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
                
                Button {
                    print("DEBUG: Select documents")
                } label: {
                    Image(systemName: "checkmark.circle")
                        .foregroundStyle(.orange)
                }
                .padding(.horizontal)
            }
            .padding()
            
            ContentUnavailableView("Trash can is empty", systemImage: "trash.fill", description: Text("You're good to go"))
        }
        .searchable(text: $searchText, isPresented: $searchIsActive, prompt: "Search for your Documents")
        .tint(/*isDarkMode ? .white : .black*/.primary)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "trash")
                }
            }
        }
        .navigationTitle("Trash")
        .navigationBarTitleDisplayMode(.automatic)
    }
}

#Preview {
    TrashView()
}
