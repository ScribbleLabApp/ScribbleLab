//
//  SLSettingsView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 07.10.23.
//

import SwiftUI

struct SLSettingsView: View {
    @Environment(\.openURL) var openURL
    @State private var resetAlertIsPresented = false
    @State private var deleteAccountIsPresented = false
    @State private var redemtionSheetIsPresented = false
    
    // FIXME: only for evelopment purposes
    @State private var newNotificationDeveloperTool = false

    var body: some View {
        NavigationStack {
            List {
                Section() {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        // TODO: Delete MOCK data
                        // let the user updload an profile picture and store it on their device
                        // also fetch their username and bio/description
                        // FIXME: Maybe change the bio to an streak feature
                        HStack {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .clipShape(Circle())
                            VStack(alignment: .leading) {
                                Text("Username")
                                    .font(.title2)
                                Text("Bio or description")
                                    .font(.footnote)
                            }
                            
                        }
                    }
                    Label("Redeem Code", systemImage: "gift") // app.gift, giftcard
                        .onTapGesture {
                            redemtionSheetIsPresented.toggle()
                        }
                        .sheet(isPresented: $redemtionSheetIsPresented) {
                            RedemtionSheetView()
                        }
                } header: {
                    Text("Profile")
                } footer: {
                    Text("With these settings you can customize your profile")
                }
                
                Section() {
                    NavigationLink {
                        SLDarkmodeSettingsView()
                    } label:{
                        Label("Darkmode", systemImage: "moon.fill")
                    }
                    Label("Units", systemImage: "ruler")
                    Label("Apple Pencil", systemImage: "applepencil.and.scribble")
                    Label("Autocorrection", systemImage: "textformat.abc.dottedunderline")
                    Label("Accessibility", systemImage: "person.fill")
                    Label("Notifications", systemImage: "bell.badge")
                    Label("Privacy", systemImage: "hand.raised.fill")
                    Label("Collaboration", systemImage: "person.2.badge.gearshape")
                    Label("Extensions", systemImage: "puzzlepiece.extension")
                    Label("Cloud sync", systemImage: "icloud")
                } header: {
                    Text("App settings")
                } footer: {
                    Text("Some simple settings to make the app even better")
                }
                
                Section() {
                    Button {
                        resetAlertIsPresented.toggle()
                    } label: {
                        Label("Reset settings", systemImage: "restart")
                            .foregroundStyle(Color.red)
                    }
                    .alert(isPresented: $resetAlertIsPresented) {
                        Alert(title: Text("Important message"), message: Text("Do you really want to reset your customized data. This operation cannot be undone"), primaryButton: .default(Text("Cancel"), action: {}), secondaryButton: .destructive(Text("Confirm").fontWeight(.semibold), action: {
                                // TODO: Call the to factory setting func
                                
                            }))
                        }
                    Button {
                        deleteAccountIsPresented.toggle()
                    } label: {
                        Label("Delete account", systemImage: "person.crop.circle.badge.xmark")
                    }
                    .alert(isPresented: $deleteAccountIsPresented) {
                        // FIXME: - Create confirm button with color red
                        Alert(title: Text("Important message"), message: Text("Do you really want to delete your account? This operation cannot be undone"), primaryButton: .default(Text("Cancel"), action: {}), secondaryButton: .destructive(Text("Confirm").fontWeight(.semibold), action: {
                            // TODO: Call the to factory setting func
                            
                        }))
                    }
                        .foregroundStyle(Color.red)
                } header: {
                    Text("Dangerzone")
                } footer: {
                    Text("These settings can cause loosing all you customized settings")
                }
                
//                #if os(macOS)
                // MARK: App Update Section
                Section() {
                    NavigationLink {
                        SLUpdateView()
                    } label: {
                        Label("Check for updates", systemImage: "restart")
                    }
                    
                    Label("Enroll for the nightly build programme", systemImage: "gear.badge")
                        .onTapGesture {
                            openURL(URL(string: "https://www.apple.com")!)
                        }
                    Label("Enroll for the beta programme", systemImage: "gear.badge")
                        .onTapGesture {
                            openURL(URL(string: "https://www.apple.com")!)
                        }
                    Label("Enroll for the alpha programme", systemImage: "gear.badge")
                        .onTapGesture {
                            openURL(URL(string: "https://www.apple.com")!)
                        }
                } header: {
                    Text("")
                } footer: {
                    Text("These settings are responsible for the updates of this app. In order to enroll to the programmes you need to be registered to our ScribbleLab Developer Programm (free). Follow [this link](https://github.com/ScribbleLabApp/ScribbleLab) for a more detailed description.")
                }
//                #endif
                
                Section() {
                    NavigationLink {
                        SLInfoView()
                    } label: {
                        Label("Info", systemImage: "info.bubble")
                    } // info.circle
                    NavigationLink {
                        SLHelpView()
                    } label: {
                        Label("Help", systemImage: "questionmark.bubble")
                    }
                    NavigationLink {
                        SLLicenseView()
                    } label: {
                        Label("License", systemImage: "list.clipboard")
                    }
                    NavigationLink {
                        SLContributorView()
                    } label: {
                        Label("Contributors", systemImage: "person.3.fill")
                    }
                } header: {
                    Text("Other")
                } footer: {
                    Text("")
                }
                
                // MARK: - Developer settings
                // FIXME: Delete this section when realesing the alpha v.0.0.1-alpha version
                #warning("Developer setting")
                Section() {
                    Button {
                        newNotificationDeveloperTool.toggle()
                        print("DEBUG: new notification \(newNotificationDeveloperTool)")
                    } label: {
                        Label("Change state of newNotification", systemImage: "hammer")
                    }
                } header: {
                    Text("Developer tools")
                } footer: {
                    Text("Developer settings. Only for testing purpsoses!")
                }
            }
            .tint(.black)
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SLSettingsView()
}
