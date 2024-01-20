//
//  SLAppleSchoolworkIntegrationView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 20.01.24.
//

import SwiftUI

struct SLAppleSchoolworkIntegrationView: View {
    @State private var appleSchoolworkOn: Bool = false
    @Environment(\.openURL) private var openURL
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Toggle(isOn: $appleSchoolworkOn) {
                        Text("Apple Schoolwork")
                    }
                }
                
                Section {
                    
                } header: {
                    Text("Apple Schoolwork Settings")
                }
                
                Section {
                    Button {
                        print("DEBUG: Reset custom apple schoolwork settings")
                    } label: {
                        Text("Reset Apple Schoolwork Settings")
                            .foregroundStyle(.red)
                    }
                }
                
                Section {
                    Button {
                        print("DEV/TEST: Open Documentation")
                        openURL(URL(string: "https://github.com/ScribbleLabApp/ScribbleLab")!)
                    } label: {
                        Label(
                            title: { Text("Open Integration Documentation") },
                            icon: { Image(systemName: "doc.text.magnifyingglass") }
                        )
                    }
                    
                    Button {
                        
                    } label: {
                        Label(
                            title: { Text("Security Information") },
                            icon: { Image(systemName: "lock.shield") }
                        )
                    }
                } header: {
                    Text("Ressources")
                } footer: {
                    Text("Read our [documentation article](https://github.com/ScribbleLabApp/ScribbleLab) about how to use and configure Apple Schoolwork in ScribbleLab and how we are [managing and using your data](https://github.com/ScribbleLabApp/ScribbleLab).")
                }
            }
            .navigationTitle("Apple Schoolwork")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SLAppleSchoolworkIntegrationView()
}
