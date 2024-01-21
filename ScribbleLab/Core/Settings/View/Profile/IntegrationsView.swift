//
//  IntegrationsView.swift
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

struct IntegrationsView: View {
    @State private var allowIntegartions: Bool = true
    
    var body: some View {
//        NavigationStack {
            Form {
                Section {
                    Toggle(isOn: $allowIntegartions) {
                        Text("Allow integrations")
                    }
                }
                
                Section {
                    NavigationLink {
                        SLGoogleClassroomIntegrationView()
                    } label: {
                        Text("Google Classroom")
                    }
                    
                    NavigationLink {
                        SLAppleSchoolworkIntegrationView()
                    } label: {
                        Text("Apple Schoolwork")
                    }
                    
                    NavigationLink {
                        SLScribbleLinkIntegrationView()
                    } label: {
                        Text("ScribbleLink")
                    }
                } header: {
                    Text("Integrations")
                } footer: {
                    Text("Connect Google Classroom or Apple Schoolwork with ScribbleLab for a more enhanced study experience. Learn more about how to integrate Google Classroom/Apple Schoolwork into ScribbleLab and how we manage your data.")
                }
                
                Section {
                    NavigationLink {
                        
                    } label: {
                        Text("Cloud Storage & Backup")
                    }
                }
                
                Section {
                    Button {
                        
                    } label: {
                        Text("Reset Integration Settings")
                            .foregroundStyle(.red)
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Sign out of all integrations")
                            .foregroundStyle(.red)
                    }
                }
            }
            .navigationTitle("Integrations")
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Manage Settings") {
                        print("DEBUG: Manage Settings")
                    }
                }
            }
//        }
    }
}

#Preview {
    NavigationStack {
        IntegrationsView()
    }
}
