//
//  SLDarkmodeSettingsView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 08.10.23.
//

import SwiftUI

struct SLDarkmodeSettingsView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    @State private var darkmodePicker = 0
    
    var body: some View {
        NavigationStack {
            List  {
                Section() {
                    HStack {
                        Toggle(isOn: $isDarkMode) {
                            Text("Enable Darkmode")
                        }
                        .alert(isPresented: $isDarkMode) {
                            Alert(title: Text("Warning"), message: Text("Do you really want to enable Darkmode (beta)? Some modules are not adapted to darkmode."), primaryButton: .default(Text("Cancel"), action: {
                                    isDarkMode = false
                            }), secondaryButton: .destructive(Text("Enable").fontWeight(.semibold), action: {
                                    // TODO: Call the darkmode func
                                    isDarkMode = true
                                }))
                            }
//                        .onChange(of: dar, initial: true) {
//                            print("Enable darkmode")
//                            // TODO: Add darkmode func in version 1.2
//                            
//                        }
                    }
                    HStack {
                        // TODO: Link toggle and picker, add darkmode support in v.1.2
                        Picker(selection: $darkmodePicker, label: Text("Display mode")) {
                            Text("Ignore system scheme").tag(0)
                            Text("Follow system scheme").tag(1)
                        }
                    }
                } header: {
                    Text("Darkmode settings")
                } footer: {
                    Text("Toggle the button to enable Darkmode. Note if your system is on a light scheme and you've selected Follow system scheme the darkmode setting will be ignored. Please select 'Ignore system scheme'.")
                }
            }
            .navigationTitle("Darkmode (BETA)")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SLDarkmodeSettingsView()
}
