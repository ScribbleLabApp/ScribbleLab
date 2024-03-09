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
                    
                    SettingPage(title: "Avatars (BETA)") {}
                        .previewIcon("sparkles", color: .darkOrange)
                    
                    SettingPage(title: "Streak (BETA)") {}
                        .previewIcon("flame", color: .darkOrange)
                }
                
                SettingGroup(header: "Advanced Settings") {
                    SettingPage(title: "Notifications") {
                        notification
                    }
                        .previewIcon("bell.badge.fill", color: .red)
                    
                    SettingPage(title: "Focus (BETA)") {}
                        .previewIcon("moon.fill", color: .indigo)
                }
                
                SettingGroup {
                    SettingPage(title: "General") {
                        general
                    }
                        .previewIcon("gear", color: .gray)
                    
                    SettingPage(title: "Appereance") {}
                        .previewIcon("sun.max.fill", color: .blue)
                    
                    SettingPage(title: "Accessibility (BETA)") {}
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
    
    // MARK: - General Settings
    @SettingBuilder var general: some Setting {
        SettingGroup {
            SettingPage(title: "Info") {}
                .previewIcon("info.bubble", color: .gray)
            
            SettingPage(title: "Updates") {}
                .previewIcon("restart", color: .darkOrange)
        }
        
        SettingGroup {
            SettingPage(title: "Autocorrection") {}
                .previewIcon("textformat.abc.dottedunderline", color: .pink)
            
            SettingPage(title: "Apple Pencil") {}
                .previewIcon("applepencil", color: .yellow)
            
            SettingPage(title: "Cloud sync") {}
                .previewIcon("cloud.fill", color: .blue)
            
            SettingPage(title: "Collaboration") {}
                .previewIcon("person.line.dotted.person.fill", color: .teal)
            
            SettingPage(title: "Extensions") {}
                .previewIcon("puzzlepiece.extension.fill", color: .purple)
            
            SettingPage(title: "Functions") {}
                .previewIcon("sparkles", color: .purple)
            
            SettingPage(title: "Flags") {}
                .previewIcon("flag.fill", color: .red)
        }
        
        SettingGroup {
            SettingPage(title: "Date & Time") {}
                .previewIcon("calendar", color: .red)
            
            SettingPage(title: "Fonts") {}
                .previewIcon("f.cursive", color: .pink)
        }
        
        SettingGroup {
            SettingPage(title: "Legal Notice") {}
                .previewIcon("book.pages", color: .gray)
        }
    }
    
    // MARK: - Info Settings
    
    // MARK: - Update Settings
    
    // MARK: - Notification Settings
    
    @AppStorage("notificationsGranted") var notificationsGranted: Bool = true // TODO: link with AppDelegate
    
    @AppStorage("notifyWhenChangesMade") var notifyWhenChangesMade: Bool = true
    @AppStorage("notifyWhenRecievedInvitation") var notifyWhenRecievedInvitation: Bool = false
    @AppStorage("instructionsTippsTricks") var instructionsTippsTricks: Bool = true
    @AppStorage("tutorials") var tutorials: Bool = false
    @AppStorage("otherNotifications") var otherNotifications: Bool = true
    @AppStorage("newFunctions") var newFunctions: Bool = true
    
    /**
     InAppNotifications are used to display critical alerts or to show feedback. It can not be disabled by default.
     */
    @AppStorage("inAppNotifications") var inAppNotifications: Bool = true
    
    /**
     UpdateReminders are used to remind the user to update their ScribbleLab version. It can not be disabled by default.
     */
    @AppStorage("updateReminders") var updateReminders: Bool = true
    
    /**
     Reset modified NotificationSettings.
     */
    func resetSettings() {
        notifyWhenChangesMade = true
        notifyWhenRecievedInvitation = true
        instructionsTippsTricks = true
        tutorials = false
        otherNotifications = true
        newFunctions = true
        
        inAppNotifications = true
        updateReminders = true
    }
    
    @SettingBuilder var notification: some Setting {
        SettingGroup(footer: "Stay up to date with push notifications.") {
            SettingToggle(title: "Allow notifications", isOn: $notificationsGranted)
            // TODO: Link `notificationsGranted` with other notification cases except for `inAppNotifications` and `updateReminders`
        }
        
        SettingGroup(header: "Notification Settings") {
            SettingToggle(title: "Notify when changes made", isOn: $notifyWhenChangesMade)
            SettingToggle(title: "Notify when recieved invitation", isOn: $notifyWhenRecievedInvitation)
            SettingToggle(title: "Instructions, Tipps & Tricks", isOn: $instructionsTippsTricks)
            SettingToggle(title: "Tutorials", isOn: $tutorials)
            SettingToggle(title: "Other notifications", isOn: $otherNotifications)
            SettingToggle(title: "New functions", isOn: $newFunctions)
            
            SettingToggle(title: "In-App notifications", isOn: .constant(true))
            SettingToggle(title: "Updates", isOn: .constant(true))
        }
        
        SettingGroup {
            SettingButton(title: "Reset settings") {
                resetSettings()
                print("DEBUG: Settings are resetted to standart.")
            }
        }
    }
    
    // MARK: - Developer Settings
    
    // MARK: - Profile Settings
    
    // MARK: - Focus Settings
}

#Preview {
    SettingsView()
}
