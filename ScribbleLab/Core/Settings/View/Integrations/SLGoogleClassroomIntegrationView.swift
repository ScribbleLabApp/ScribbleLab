//
//  SLGoogleClassroomIntegrationView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 19.01.24.
//

import SwiftUI

struct SLGoogleClassroomIntegrationView: View {
    @State private var googleClassroomOn: Bool = false
    
    var body: some View {
        NavigationStack {
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
            }
            .navigationTitle("Google Classroom")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SLGoogleClassroomIntegrationView()
}
