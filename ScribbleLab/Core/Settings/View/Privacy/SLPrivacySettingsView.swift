//
//  SLPrivacySettingsView.swift
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

struct SLPrivacySettingsView: View {
    var body: some View {
        Form {
            Section {
                NavigationLink {
                    
                } label: {
                    Label("Photo Libary", systemImage: "photo.stack")
                }
                
                NavigationLink {
                    
                } label: {
                    Label("Microphone", systemImage: "mic")
                }
                
                NavigationLink {
                    
                } label: {
                    Label("Camera", systemImage: "camera")
                }
                
                NavigationLink {
                    
                } label: {
                    Label("File access", systemImage: "folder")
                }
                
                NavigationLink {
                    
                } label: {
                    Label("Analytics & Usage data", systemImage: "app.connected.to.app.below.fill")
                }
            } footer: {
                Text("ScribbleLab requires access for all access listed above. For a more detailed description of how and why Scribble Lab uses and requires these accesses, click on the accesses.")
            }
            
            Section {
                NavigationLink("Analytics & Improvements") {
                    
                }
                
                NavigationLink("Usage Data") {
                    
                }
            }
            
            Section {
                NavigationLink("App data protection report") {
                    
                }
            }
            
            Section {
                NavigationLink("Account Protection") {
                    
                }
                NavigationLink("Account Settings") {
                    ProfileView()
                }
            } header: {
                Text("Account Privacy")
            }
            
            Section {
                NavigationLink("Developer Mode") {
                    
                }
                
                NavigationLink("Security Mode") {
                    
                }
            } header: {
                Text("Security")
            }
                .navigationTitle("Data protection & Security")
                .navigationBarTitleDisplayMode(.inline)
        }
        .tint(.orange)
    }
}

#Preview {
    NavigationStack {
        SLPrivacySettingsView()
    }
}
