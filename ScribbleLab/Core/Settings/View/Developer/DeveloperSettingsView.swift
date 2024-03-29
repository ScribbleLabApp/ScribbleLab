//
//  DeveloperSettingsView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 23.01.24.
//

import SwiftUI

struct DeveloperSettingsView: View {
    @State private var allowBeta: Bool = false
    var body: some View {
        Form {
            Section {
                NavigationLink("Diagnosis") {
                    
                }
                Button("Clear ScribbleLab cache") {
                    
                }
            } header: {
                Text("Troubleshooting")
            } footer: {
                // swiftlint:disable line_length
                Text("Clear ScribbleLab's experience cache to instantly view recently modified app settings. Integrations will not be affected.")
                // swiftlint:enable line_length
            }
            
            Section {
                Toggle(isOn: $allowBeta) {
                    Text("Allow usage of Pre-Releases")
                }
                
                NavigationLink("Manage Pre-Release Versions") {}
            } header: {
                Text("Pre-Releases & Dev-Builds")
            }
            
            Section {
                NavigationLink("Connection status") {
                    
                }
            } header: {
                Text("Network & Connection")
            }
            
            #if DEBUG // Change to APLHA
            Section {
                NavigationLink("Test Accounts") {
                    
                }
            } header: {
                Text("Contributor settings")
            } footer: {
                // swiftlint:disable line_length
                Text("You can use a test account to test your changes made. When using a ScribbleLabApp Test account you agree to our [Terms Of Usage](https://github.com/ScribbleLabApp/ScribbleLab), [Code Of Conduct](https://github.com/ScribbleLabApp/ScribbleLab)")
                // swiftlint:enable line_length
            }
            
            Section {
                NavigationLink("Test") {
                    AskNotificationView()
                }
            } header: {
                Text("Test")
            }
            #endif
        }
        .navigationTitle("Developer")
        .navigationBarTitleDisplayMode(.inline)
        .tint(.orange)
    }
}

#Preview {
    NavigationStack {
        DeveloperSettingsView()
    }
}
