//
//  DocumentEditorView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 29.05.24.
//

import SwiftUI
import ScribbleCoreServices

struct DocumentEditorView: View {
    @State private var showSideBar = true
    @State private var placeholder = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                TextEditor(text: $placeholder)
            }
            .inspector(isPresented: $showSideBar) {
                VStack {
                    DisclosureGroup("Styling") {
                        HStack {
                            Button {} label: {
                                Image(systemName: "bold")
                            }.padding(5)
                            
                            Spacer()
                            
                            Button {} label: {
                                Image(systemName: "underline")
                            }.padding(5)
                            
                            Spacer()

                            Button {} label: {
                                Image(systemName: "italic")
                            }.padding(5)
                            
                            Spacer()

                            Button {} label: {
                                Image(systemName: "strikethrough")
                            }.padding(5)
                        }
                    }

                }
                .padding(5)
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { } label: {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.black)
                            .padding(10)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.white)
                                    .shadow(radius: 10)
                            }
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showSideBar.toggle()
                    } label: {
                        Image(systemName: "sidebar.right")
                            .foregroundColor(.black)
                            .padding(10)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.white)
                                    .shadow(radius: 10)
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        DocumentEditorView()
    }
}
