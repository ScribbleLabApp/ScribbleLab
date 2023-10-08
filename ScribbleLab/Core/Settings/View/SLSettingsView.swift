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
                } header: {
                    Text("Profile")
                } footer: {
                    Text("With these settings you can customize your profile")
                }
                
                Section() {
                    Label("Darkmode", systemImage: "moon.fill")
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
                    // TODO: Display an alert
//                    Label("Reset settings", systemImage: "restart")
                    Button {
                        resetAlertIsPresented.toggle()
                    } label: {
                        Label("Reset settings", systemImage: "restart")
                            .foregroundStyle(Color.red)
                    }
                            .alert(isPresented: $resetAlertIsPresented) {
                                // FIXME: - Create confirm button with color red
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
                
                Section() {
                    Label("Info", systemImage: "info.bubble") // info.circle
                    Label("Help", systemImage: "questionmark.bubble")
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
            }
            .tint(.black)
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SLSettingsView()
}
