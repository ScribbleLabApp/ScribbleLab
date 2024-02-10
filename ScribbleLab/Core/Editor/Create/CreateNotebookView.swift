//
//  CreateDocumentView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 29.01.24.
//

import SwiftUI

struct CreateNotebookView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Divider()
            // MARK: - [START] STICKY HEADER DOCUMENT CONFIG
            HStack {
                // [START] DOCUMENT COVER & PAPER OVERVIEW
                VStack {
                    // [START] COVER
                    Text("COVER")
                        .foregroundStyle(.secondary)
                        .font(.footnote)
                    
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 120, height: 150)
                    
                    Text("Cover name")
                        .font(.footnote)
                    // [END] COVER
                }
                
                VStack {
                    // [START] COVER
                    Text("PAPER")
                        .foregroundStyle(.secondary)
                        .font(.footnote)
                    
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 120, height: 150)
                    
                    Text("Lines")
                        .font(.footnote)
                    // [END] COVER
                }
                // [END] DOCUMENT COVER & PAPER OVERVIEW
                Spacer()
                
                // [START] DOCUMENT SETTINGS
                Form {
                    Section {
                        HStack {
                            Text("Title")
                        }
                        HStack {
                            Text("Language")
                        }
                        HStack {
                            Text("Cover")
                        }
                    }
                    
                    Section {
                        HStack {
                            Text("Size")
                        }
                        HStack {
                            Text("Color")
                        }
                    } header: {
                        Text("Cover-Templates")
                    }
                }
                
                Spacer()
                // [END] DOCUMENT SETTINGS
            }
            
            // MARK: [END] STICKY HEADER DOCUMENT CONFIG
        }
        .navigationTitle("New Notebook")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    print("DEBUG/HELPER: Create Notebook with config")
                } label: {
                    Text("Create")
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .background {
                            Capsule()
                                .frame(width: 100, height: 40)
                                .foregroundStyle(.orange)
                        }
                        .padding(.horizontal)
                }
            }
        }
        .tint(.orange)
    }
}

#Preview {
    NavigationStack {
//        Text("Hi")
//            .sheet(isPresented: .constant(true)) {
                CreateNotebookView()
//        }
    }
}
