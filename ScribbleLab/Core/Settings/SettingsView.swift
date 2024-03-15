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

// swiftlint:disable type_body_length
// swiftlint:disable line_length
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
                    
                    SettingPage(title: "Appereance") {
                        appereance
                    }
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
            SettingPage(title: "Legal Notice") {
                legal
            }
                .previewIcon("book.pages", color: .gray)
        }
    }
    
    // MARK: - Info Settings
    
    // MARK: - Update Settings
    
    // MARK: - Legal Notice Settings
    @SettingBuilder var legal: some Setting {
        SettingCustomView(id: "hero") {
            VStack {
                Color.gray
                    .opacity(0.75)
                    .cornerRadius(12)
                    .overlay {
                        Image(systemName: "list.clipboard.fill")
                            .foregroundStyle(.white)
                            .font(.title.bold())
                    }
                    .frame(height: 150)
                    .padding(.horizontal, 16)
                
                Text("License Agreement")
                    .fontWeight(.semibold)
                    .font(.title)
                
                Text("When using ScribbleLabApp's services you agree to our license.")
                    .foregroundStyle(.secondary)
                    .font(.footnote)
            }
        }
        
        SettingCustomView(id: "license") {
            VStack(alignment: .center) {
                VStack(alignment: .leading) {
                    VStack(alignment: .center) {
                        Text("Apache License")
                        Text("Version 2.0, January 2004")
                        Text("http://www.apache.org/licenses/")
                        Text("")
                        // FIXME: Align this text to center
                        Text("TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION")
                            .multilineTextAlignment(.center)
                            .fontWeight(.semibold)
                    }
                    
                    Text("")
                    Text("1. Definitions.")
                    Text("'License' shall mean the terms and conditions for use, reproduction, and distribution as defined by Sections 1 through 9 of this document.")
                    Text("")
                    Text("'Licensor' shall mean the copyright owner or entity authorized by the copyright owner that is granting the License.")
                    Text("")
                    Text("'Legal Entity' shall mean the union of the acting entity and all other entities that control, are controlled by, or are under common control with that entity. For the purposes of this definition, 'control' means (i) the power, direct or indirect, to cause thedirection or management of such entity, whether by contract or otherwise, or (ii) ownership of fifty percent (50%) or more of the outstanding shares, or (iii) beneficial ownership of such entity.")
                    Text("")
                    Text("'You' (or 'Your') shall mean an individual or Legal Entity exercising permissions granted by this License.")
                    Text("'Source' form shall mean the preferred form for making modifications, including but not limited to software source code, documentation source, and configuration files.")
                    Text("")
                    Text("'Object' form shall mean any form resulting from mechanical transformation or translation of a Source form, including but not limited to compiled object code, generated documentation, and conversions to other media types.")
                    Text("")
                    Text("'Work' shall mean the work of authorship, whether in Source or Object form, made available under the License, as indicated by a copyright notice that is included in or attached to the work (an example is provided in the Appendix below).")
                    Text("'Derivative Works' shall mean any work, whether in Source or Object form, that is based on (or derived from) the Work and for which the editorial revisions, annotations, elaborations, or other modifications represent, as a whole, an original work of authorship. For the purposes of this License, Derivative Works shall not include works that remain separable from, or merely link (or bind by name) to the interfaces of, the Work and Derivative Works thereof.")
                    Text("")
                    Text("'Contribution' shall mean any work of authorship, including the original version of the Work and any modifications or additions to that Work or Derivative Works thereof, that is intentionally submitted to Licensor for inclusion in the Work by the copyright owner or by an individual or Legal Entity authorized to submit on behalf of the copyright owner. For the purposes of this definition, 'submitted' means any form of electronic, verbal, or written communication sent to the Licensor or its representatives, including but not limited to communication on electronic mailing lists, source code control systems, and issue tracking systems that are managed by, or on behalf of, the Licensor for the purpose of discussing and improving the Work, but excluding communication that is conspicuously marked or otherwise designated in writing by the copyright owner as 'Not a Contribution.'")
                    Text("")
                    Text("'Contributor' shall mean Licensor and any individual or Legal Entity on behalf of whom a Contribution has been received by Licensor and subsequently incorporated within the Work.")
                    Text("")
                    Text("2. Grant of Copyright License. Subject to the terms and conditions of this License, each Contributor hereby grants to You a perpetual, worldwide, non-exclusive, no-charge, royalty-free, irrevocable copyright license to reproduce, prepare Derivative Works of, publicly display, publicly perform, sublicense, and distribute the Work and such Derivative Works in Source or Object form.")
                    Text("")
                    Text("3. Grant of Patent License. Subject to the terms and conditions of this License, each Contributor hereby grants to You a perpetual, worldwide, non-exclusive, no-charge, royalty-free, irrevocable (except as stated in this section) patent license to make, have made, use, offer to sell, sell, import, and otherwise transfer the Work, where such license applies only to those patent claims licensable by such Contributor that are necessarily infringed by their Contribution(s) alone or by combination of their Contribution(s) with the Work to which such Contribution(s) was submitted. If You institute patent litigation against any entity (including a cross-claim or counterclaim in a lawsuit) alleging that the Work or a Contribution incorporated within the Work constitutes direct or contributory patent infringement, then any patent licenses granted to You under this License for that Work shall terminate as of the date such litigation is filed.")
                    Text("")
                    Text("4. Redistribution. You may reproduce and distribute copies of the Work or Derivative Works thereof in any medium, with or without modifications, and in Source or Object form, provided that You meet the following conditions:")
                    Text("(a) You must give any other recipients of the Work or Derivative Works a copy of this License; and")
                    Text("(b) You must cause any modified files to carry prominent notices stating that You changed the files; and")
                    Text("(c) You must retain, in the Source form of any Derivative Works that You distribute, all copyright, patent, trademark, and attribution notices from the Source form of the Work, excluding those notices that do not pertain to any part of the Derivative Works; and")
                    Text("(d) If the Work includes a 'NOTICE' text file as part of its distribution, then any Derivative Works that You distribute must include a readable copy of the attribution notices contained within such NOTICE file, excluding those notices that do not pertain to any part of the Derivative Works, in at least one of the following places: within a NOTICE text file distributed as part of the Derivative Works; within the Source form or documentation, if provided along with the Derivative Works; or, within a display generated by the Derivative Works, if and wherever such third-party notices normally appear. The contents of the NOTICE file are for informational purposes only and do not modify the License. You may add Your own attribution notices within Derivative Works that You distribute, alongside or as an addendum to the NOTICE text from the Work, provided that such additional attribution notices cannot be construed as modifying the License.")
                    Text("")
                    Text("You may add Your own copyright statement to Your modifications and may provide additional or different license terms and conditions for use, reproduction, or distribution of Your modifications, or for any such Derivative Works as a whole, provided Your use, reproduction, and distribution of the Work otherwise complies with the conditions stated in this License.")
                    Text("")
                    Text("5. Submission of Contributions. Unless You explicitly state otherwise, any Contribution intentionally submitted for inclusion in the Work by You to the Licensor shall be under the terms and conditions of this License, without any additional terms or conditions. Notwithstanding the above, nothing herein shall supersede or modify the terms of any separate license agreement you may have executed with Licensor regarding such Contributions.")
                    Text("")
                    Text("6. Trademarks. This License does not grant permission to use the trade names, trademarks, service marks, or product names of the Licensor, except as required for reasonable and customary use in describing the origin of the Work and reproducing the content of the NOTICE file.")
                    Text("")
                    Text("7. Disclaimer of Warranty. Unless required by applicable law or agreed to in writing, Licensor provides the Work (and each Contributor provides its Contributions) on an 'AS IS' BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied, including, without limitation, any warranties or conditions of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A PARTICULAR PURPOSE. You are solely responsible for determining the appropriateness of using or redistributing the Work and assume any risks associated with Your exercise of permissions under this License.")
                    Text("")
                    Text("8. Limitation of Liability. In no event and under no legal theory, whether in tort (including negligence), contract, or otherwise, unless required by applicable law (such as deliberate and grossly negligent acts) or agreed to in writing, shall any Contributor be liable to You for damages, including any direct, indirect, special, incidental, or consequential damages of any character arising as a result of this License or out of the use or inability to use the Work (including but not limited to damages for loss of goodwill, work stoppage, computer failure or malfunction, or any and all other commercial damages or losses), even if such Contributor has been advised of the possibility of such damages.")
                    Text("")
                    Text("9. Accepting Warranty or Additional Liability. While redistributing the Work or Derivative Works thereof, You may choose to offer, and charge a fee for, acceptance of support, warranty, indemnity, or other liability obligations and/or rights consistent with this License. However, in accepting such obligations, You may act only on Your own behalf and on Your sole responsibility, not on behalf of any other Contributor, and only if You agree to indemnify, defend, and hold each Contributor harmless for any liability incurred by, or claims asserted against, such Contributor by reason of your accepting any such warranty or additional liability.")
                    Text("")
                    Text("END OF TERMS AND CONDITIONS")
                        .fontWeight(.semibold)
                    
                    Text("")
                    
                    Text("APPENDIX: How to apply the Apache License to your work.")
                        .fontWeight(.semibold)
                    
                    Text("To apply the Apache License to your work, attach the following boilerplate notice, with the fields enclosed by brackets '[]' replaced with your own identifying information. (Don't include the brackets!)  The text should be enclosed in the appropriate comment syntax for the file format. We also recommend that a file or class name and description of purpose be included on the same 'printed page' as the copyright notice for easier identification within third-party archives.")
                    Text("")
                    Text("Copyright [2023] [ScribbleLab]")
                    Text("")
                    Text("Licensed under the Apache License, Version 2.0 (the 'License');")
                    Text("you may not use this file except in compliance with the License.")
                    Text("You may obtain a copy of the License at")
                    Text("")
                    Text("http://www.apache.org/licenses/LICENSE-2.0")
                        .fontWeight(.semibold)
                    Text("")
                    Text("Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an 'AS IS' BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.")
                }
                .padding()
                .multilineTextAlignment(.leading)
            }
        }
    }
    
    // MARK: - Notification Settings
    
//    @AppStorage("notificationsGranted") var notificationsGranted: Bool = true // TODO: link with AppDelegate
    // Using appDelegate.notificationsAllowed for above
    @EnvironmentObject var appDelegate: AppDelegate
    
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
            SettingToggle(title: "Allow notifications", isOn: $appDelegate.notificationAllowed/* $notificationsGranted */)
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
//                notificationsGranted = false
//                appDelegate.notificationAllowed = false
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
    
    // MARK: - Appereance
    @SettingBuilder var appereance: some Setting {
        SettingCustomView {
            VStack {
                Color.blue
                    .opacity(0.75)
                    .cornerRadius(12)
                    .overlay {
                        Image(systemName: "sun.max.fill")
                            .foregroundStyle(.white)
                            .font(.title.bold())
                    }
                    .frame(height: 150)
                    .padding(.horizontal, 16)
                
                Text("Appereance")
                    .fontWeight(.semibold)
                    .font(.title)
                
                Text("Customize ScribbleLab's appereance")
                    .foregroundStyle(.secondary)
                    .font(.footnote)
            }
        }
    }
    
    // MARK: - Accessibility
    
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
// swiftlint:enable type_body_length
// swiftlint:enable line_length

#Preview {
    SettingsView()
}
