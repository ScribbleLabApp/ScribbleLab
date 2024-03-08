//
//  SettingsView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 08.03.24.
//

import SwiftUI
import Setting
import ConfettiSwiftUI

struct SettingsView: View {
    @State private var confettiTrigger: Int = 0
    
    var body: some View {
        SettingStack(isSearchable: true) {
            SettingPage(title: "Settings") {
                SettingCustomView {
                    Color.darkOrange
                        .opacity(0.1)
                        .cornerRadius(12)
                        .frame(height: 70)
                        .padding(.horizontal, 16)
                        .overlay {
                            HStack {
                                Image(systemName: "heart.square.fill")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .padding(.horizontal, 7)
                                    .foregroundStyle(.darkOrange)
                                
                                VStack(alignment: .leading) {
                                    Text("Thank You!")
                                        .font(.headline)
                                    Text("You have successfully bought the premium version.")
                                }
                                
                                Spacer()
                            }
                            .padding(.horizontal, 26)
                            .onTapGesture {
                                confettiTrigger += 1
                            }
                            .confettiCannon(counter: $confettiTrigger, num: 30, confettis: [.text("❤️"), .text("🧡"), .text("💛")])
                        }
                        .tint(.primary)
                }
                
                SettingGroup(header: "Profile") {
                    SettingPage(title: "Profile") {}
                        .previewIcon("person.fill", color: .darkOrange)
                    
                    SettingPage(title: "Avatars") {}
                        .previewIcon("sparkles", color: .darkOrange)
                    
                    SettingPage(title: "Streak") {}
                        .previewIcon("flame", color: .darkOrange)
                }
                
                SettingGroup(header: "Advanced Settings") {
                    SettingPage(title: "Notifications") {}
                        .previewIcon("bell.badge.fill", color: .red)
                    
                    SettingPage(title: "Focus (BETA)") {}
                        .previewIcon("moon.fill", color: .indigo)
                }
                
                SettingGroup {
                    SettingPage(title: "General") {}
                        .previewIcon("gear", color: .gray)
                    
                    SettingPage(title: "Appereance") {}
                        .previewIcon("sun.max.fill", color: .blue)
                    
                    SettingPage(title: "Accessibility") {}
                        .previewIcon("accessibility", color: .blue)
                    
                    SettingPage(title: "Privacy & Security") {}
                        .previewIcon("hand.raised.fill", color: .blue)
                }
                
                SettingGroup(footer: "Access advanced configurations and debugging tools in our Developer Settings.") {
                    SettingPage(title: "Developer Settings") {}
                        .previewIcon("hammer.fill", color: .gray)
                }
                
                SettingGroup(header: "Resources") {
                    SettingButton(title: "Operation manual") {
                        if let url = URL(string: "https://github.com/ScribbleLabApp/ScribbleLab") {
                            #if os(iOS)
                            UIApplication.shared.open(url)
                            #else
                            NSWorkspace.shared.open(url)
                            #endif
                        }
                    }
                    
                    SettingButton(title: "Documentation") {
                        if let url = URL(string: "https://github.com/ScribbleLabApp/ScribbleLab") {
                            #if os(iOS)
                            UIApplication.shared.open(url)
                            #else
                            NSWorkspace.shared.open(url)
                            #endif
                        }
                    }
                    
                    SettingButton(title: "Status page") {
                        if let url = URL(string: "https://github.com/ScribbleLabApp/ScribbleLab") {
                            #if os(iOS)
                            UIApplication.shared.open(url)
                            #else
                            NSWorkspace.shared.open(url)
                            #endif
                        }
                    }
                    
                    SettingButton(title: "Visit us on GitHub") {
                        if let url = URL(string: "https://github.com/ScribbleLabApp/ScribbleLab") {
                            #if os(iOS)
                            UIApplication.shared.open(url)
                            #else
                            NSWorkspace.shared.open(url)
                            #endif
                        }
                    }
                    
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
