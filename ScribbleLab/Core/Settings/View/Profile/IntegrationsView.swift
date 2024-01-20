//
//  IntegrationsView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 19.01.24.
//

import SwiftUI

struct IntegrationsView: View {
    @State private var allowIntegartions: Bool = true
    var body: some View {
        NavigationStack {
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
                        
                    } label: {
                        Text("Apple Schoolwork")
                    }
                    
                    NavigationLink {
                        
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
        }
    }
}

#Preview {
    IntegrationsView()
}
