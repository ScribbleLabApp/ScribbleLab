//
//  SLGoogleClassroomIntegrationView.swift
//  ScribbleLab
//
//  Copyright (c) 2023 - 2024 ScribbleLabApp.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import SwiftUI

struct SLGoogleClassroomIntegrationView: View {
    @State private var googleClassroomOn: Bool = false
    @Environment(\.openURL) private var openURL
    
    var body: some View {
        Form {
            Section {
                Toggle(isOn: $googleClassroomOn) {
                    Text("Google Classroom")
                }
            }
            
            Section {
                Button("Sign into Google Classroom") {
                    print("DEBUG: Google classroom sign in")
                }
            }
            
            Section {
                // TODO: Google classroom settings
            } header: {
                Text("Google Classroom Settings")
            } footer: {
                
            }
            
            Section {
                Button {
                    print("DEBUG: Sign out action called")
                } label: {
                    Text("Sign Out of Google Classroom")
                        .foregroundStyle(.red)
                }
                
                Button {
                    
                } label: {
                    Text("Reset Google Classroom Settings")
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
                Text("Read our [documentation article](https://github.com/ScribbleLabApp/ScribbleLab) about how to use and configure Google Classroom in ScribbleLab and how we are [managing and using your data](https://github.com/ScribbleLabApp/ScribbleLab).")
            }
        }
        .navigationTitle("Google Classroom")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        SLGoogleClassroomIntegrationView()
    }
}
