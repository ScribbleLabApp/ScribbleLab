//
//  SLDarkmodeSettingsView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 08.10.23.
//

import SwiftUI

struct SLDarkmodeSettingsView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var viewModel = CircleCheckboxModel()
    
    var body: some View {
        Form {
            Section {
                // [CUSTOM PICKER START]
                ZStack {
                    HStack {
                        Spacer()
                        
                        VStack(alignment: .center) {
                            Image(.colorPickerBlack)
                            Text("Always dark")
                                .fontWeight(.semibold)
                            
                            // SLCircularCheckbox(selectedTheme: $selectedTheme, onTap: switchTheme, theme: .alwaysDark)
                            SLCircularCheckbox(selectedTheme: $viewModel.selectedTheme, onTap: {
                                viewModel.selectedTheme = .alwaysDark
                                viewModel.switchTheme()
                            }, theme: .alwaysDark)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .center) {
                            Image(.colorPickerWhite)
                            Text("Always light")
                                .fontWeight(.semibold)
                            
                            // SLCircularCheckbox(selectedTheme: $selectedTheme, onTap: switchTheme, theme: .alwaysLight)
                            SLCircularCheckbox(selectedTheme: $viewModel.selectedTheme, onTap: {
                                viewModel.selectedTheme = .alwaysLight
                                viewModel.switchTheme()
                            }, theme: .alwaysLight)
                        }
                        Spacer()
                    }.disabled(viewModel.useSystemColor)
                    
                    if viewModel.useSystemColor {
                        Color.gray.opacity(0.15)
                    }
                }
                    
                // [CUSTOM PICKER END]
                
                // FIXME: Toggle unused
                Toggle(isOn: $viewModel.useSystemColor) {
                    Text("Use system settings")
                }
            } header: {
                Text("Theme")
            }
            
            Section {
                Button("Create a new color theme") {
                    print("DEBUG: Create new color theme with template")
                }
            } header: {
                Text("Customization")
            } footer: {
                Text("You can create your own color theme by following our templates. Please remember that the feature is in BETA.")
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    print("DEBUG: Customize ScribbleLab")
                } label: {
                    Image(systemName: "paintbrush")
                }
            }
        }
        .navigationTitle("Appearance (BETA)")
        .navigationBarTitleDisplayMode(.inline)
        .tint(.orange)
    }
}

#Preview {
    NavigationStack {
        SLDarkmodeSettingsView()
    }
}
