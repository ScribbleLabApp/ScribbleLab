//
//  SettingsView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 08.03.24.
//

import SwiftUI
import Setting
import ConfettiSwiftUI
import DeveloperToolsSupport

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
                            .confettiCannon(
                                counter: $confettiTrigger,
                                num: 30,
                                confettis: [.text("❤️"), .text("🧡"), .text("💛")]
                            )
                        }
                    //                        .tint(.primary)
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
                    
                    SettingPage(title: "Privacy & Security") {
                        privacy
                    }
                        .previewIcon("hand.raised.fill", color: .blue)
                }
                
                SettingGroup(footer: "Access advanced configurations and debugging tools in our Developer Settings.") {
                    SettingPage(title: "Developer Settings") {
                        developer
                    }
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
     Index representing the selected push-notification language
     */
    @AppStorage("languageIndex") var languageIndex = 0
    
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
        
        languageIndex = 0
    }
    
    @SettingBuilder var notification: some Setting {
        SettingCustomView {
            VStack {
                Color.darkOrange
                    .opacity(0.75)
                    .cornerRadius(12)
                    .overlay {
                        Image(systemName: "bell.badge.fill")
                            .foregroundStyle(.white)
                        //                        .foregroundColor(.blue)
                            .font(.title.bold())
                    }
                    .frame(height: 150)
                    .padding(.horizontal, 16)
                
                Text("Push-Notifications")
                    .fontWeight(.semibold)
                    .font(.title)
                
                Text("ScribbleLab sends you push notifications to let you know about new content and updates.")
                    .foregroundStyle(.secondary)
                    .font(.footnote)
            }
        }
        
        SettingGroup(footer: "Stay up to date with push notifications from ScribbleLab. When you deny push-notifications you'll still get in-app notifications or important alerts.") {
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
        
        SettingGroup(footer: "Please note that the ScribbleLab cannot retrieve the currently set languages ​​from the push notification provider. Therefore, the languages ​​selected may not be the language displayed.") {
            SettingPicker(
                title: "Notification language (BETA)",
                choices: ["🇺🇸", "🇩🇪", "n/a", "n/a"],
                selectedIndex: $languageIndex,
                choicesConfiguration: .init(
                    pickerDisplayMode: .menu
                )
            )
        }
        
        SettingGroup(footer: "WARNING: Resetting notification settings will permanently erase all custom configurations. Once reset, any personalized preferences, alerts, or customizations will be irreversibly lost. You can still customize your notification settings again.") {
            SettingButton(title: "Reset settings") {
                resetSettings()
                print("DEBUG: Settings are resetted to standart.")
            }
        }
        
        SettingGroup(footer: "You can cancel or resubscribe to your push notification subscription at any time.") {
            SettingButton(title: "Cancel subscription") {
                notificationsGranted = false
            }
        }
    }
    
    // MARK: - Developer Settings
    @AppStorage("isDeveloper") var isDeveloper: Bool = true // FIXME: db request to check if user is eligible to see developer settings
    @AppStorage("plugInDevelopment") var plugInDevelopment: Bool = false
    
    @SettingBuilder var developer: some Setting {
        // TODO: Only display developer settings if user is enrolled to ScribbleLabApp Developer Programm
        SettingCustomView {
            VStack {
                Color.gray
                    .opacity(0.75)
                    .cornerRadius(12)
                    .overlay {
                        Image(systemName: "hammer.fill")
                            .foregroundStyle(.white)
                            .font(.title.bold())
                    }
                    .frame(height: 150)
                    .padding(.horizontal, 16)
                
                Text("ScribbleLab Developer")
                    .fontWeight(.semibold)
                    .font(.title)
                
                Text("Access ScribbleLab's hidden Developer settings, access Developer Resources & access experimental feature flags.")
                    .foregroundStyle(.secondary)
                    .font(.footnote)
            }
        }
        
        SettingGroup {
            SettingToggle(title: "Enable developer mode", isOn: $isDeveloper)
        }
        
        SettingGroup(header: "Experimental") {
            SettingPage(title: "Experimental Feature Flags") {}
        }
        
        SettingGroup(header: "Plug-In Testing", footer: "Clear the Plug-In experience cache to instantly view recently morphed Plug-In experiences. Embedded Plug-Ins do not use this cache.") {
            SettingToggle(title: "Allow plug-in testing", isOn: $plugInDevelopment)
            
            SettingPage(title: "Local Experiences") {}
            
            SettingPage(title: "Diagnose") {}
            
            SettingButton(title: "Clear experience cache") {}
        }
        
        SettingGroup(header: "AvatarKit Testing") {
            SettingPage(title: "Diagnosis") {}
            
            SettingButton(title: "Clear Avatar cache") {}
        }
        
        SettingGroup(header: "Troubleshooting", footer: "Clear ScribbleLab's experience cache to instantly view recently modified app settings. Integrations won't be affected.") {
            SettingPage(title: "Diagnosis") {}
            
            SettingButton(title: "Clear ScribbleLab cache") {}
        }
        
        SettingGroup(header: "Network & Connection") {
            SettingPage(title: "Conection status") {}
        }
    }
    
    // MARK: - Profile Settings
    
    // MARK: - Focus Settings
    
    // MARK: - Privacy & Security
    @AppStorage("developerMode") var developerMode: Bool = true // FIXME: change later to false
    @AppStorage("securityMode") var securityMode: Bool = false
    
    @SettingBuilder var privacy: some Setting {
        SettingCustomView {
            VStack {
                Color.blue
                    .opacity(0.75)
                    .cornerRadius(12)
                    .overlay {
                        Image(systemName: "hand.raised.fill")
                            .foregroundStyle(.white)
                            .font(.title.bold())
                    }
                    .frame(height: 150)
                    .padding(.horizontal, 16)
                
                Text("Data protection & Security")
                    .fontWeight(.semibold)
                    .font(.title)
                
                Text("Manage ScribbleLab's access to your data")
                    .foregroundStyle(.secondary)
                    .font(.footnote)
            }
        }
        
        SettingGroup(header: "Access", footer: "ScribbleLab requires access for all access listed above. For a more detailed description of how and why Scribble Lab uses and requires these accesses, click on the required access.") {
            SettingPage(title: "Photo Libary") {}
                .previewIcon("photo.stack", color: .red)
            
            SettingPage(title: "Microphone") {}
                .previewIcon("mic", color: .orange)
            
            SettingPage(title: "Camera") {}
                .previewIcon("camera", color: .red)
            
            SettingPage(title: "File access") {}
                .previewIcon("folder", color: .red)
        }
        
        SettingGroup {
            SettingPage(title: "Analytics") {}
                .previewIcon("app.connected.to.app.below.fill", color: .orange)
            
            SettingPage(title: "Usage Data") {} // TODO: Change symbol
                .previewIcon("app.connected.to.app.below.fill", color: .orange)
        }
        
        SettingGroup(header: "Account Safety") {
            SettingPage(title: "Configure 2FA") {} // TODO: Change symbol
                .previewIcon("lock.fill", color: .gray)
            
            SettingPage(title: "Backup Keys") {}
                .previewIcon("key.fill", color: .gray)
        }
        
        SettingGroup(footer: "Require ScribbleLab to be unlocked with Face ID.") {
            SettingPage(title: "Screen lock") {}
                .previewIcon("lock.shield", color: .gray)
            
            SettingPage(title: "Document lock") {} // TODO: Custom Password or FaceID
                .previewIcon("lock.doc", color: .gray)
        }
        
        SettingGroup(header: "Security") {
            SettingToggle(title: "Security Mode", isOn: $securityMode)
            SettingToggle(title: "Developer Mode", isOn: $developerMode)
        }
    }
}

#Preview {
    SettingsView()
}
