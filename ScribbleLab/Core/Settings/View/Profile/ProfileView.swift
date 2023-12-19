//
//  ProfileView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 08.10.23.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    /// - View Properties
    @StateObject var imagePicker = ImagePicker()
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    /// - Action Properties:
    @State private var signOutWarningIsPresented = false
    @State private var deleteAccountWarning = false
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    PhotosPicker(selection: $imagePicker.imageSelection, matching: .images, photoLibrary: .shared()) {
                        if let image = imagePicker.image {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .clipShape(Circle())
                                .padding()
                        } else {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .clipShape(Circle())
                                .padding()
                                .foregroundStyle(isDarkMode ? .orange : .darkOrange)
                        }
                    }
                    Text("Test User")
                        .font(.title2).bold()
                    
                    Text("test@gmail.com")
                        .tint(Color(.darkGray))
                }
                
                Form {
                    Section {
                        Button("Change Password") {
                            
                        }
                        Button("Change Email") {
                            
                        }
                        Button("Change Username") {
                            
                        }
                        NavigationLink {
                            SLOTP_2FA_ConfigView()
                                .navigationBarBackButtonHidden()
                        } label: {
                            Text("Set up 2FA")
                                .tint(.black)
                        }
                    } header: {
                        Text("User Profile")
                    } footer: {
                        
                    }
                    
                    Section() {
                        Button("Edit Profile") {
                            print("DEBUG: Edit profile")
                        }
                    }
                    
                    Section {
                        Picker(selection: .constant(1), label: Text("Profile Image Size")) {
                            Text("Small").tag(0)
                            Text("Medium").tag(1)
                            Text("Large").tag(2)
                        }
                        
                        Button("Clear Image Cache") {
                            
                        }
                    }
                    
                    Section("Danger zone") {
                        Button {
                            signOutWarningIsPresented.toggle()
                        } label: {
                            Text("Sign Out")
                                .foregroundStyle(.red)
                                .bold()
                        }
                        .alert(isPresented: $signOutWarningIsPresented) {
                            Alert(title: Text("Important message"), message: Text("Do you really want to sign out? You'll be not able to use this app without signing in"), primaryButton: .default(Text("Cancel"), action: {}), secondaryButton: .destructive(Text("Confirm").fontWeight(.semibold), action: {
                                // TODO: Call the to factory setting func
                                SLAuthService.shared.signOut()
                            }))
                        }
                        
                        Button("Delete Account") {
                            deleteAccountWarning.toggle()
                        }
                        .tint(.red)
                        .bold()
                        .alert(isPresented: $deleteAccountWarning) {
                            Alert(title: Text("Important message"), message: Text("Do you really want to delete your account? This operation can't be undone"), primaryButton: .default(Text("Cancel"), action: {}), secondaryButton: .destructive(Text("Confirm").fontWeight(.semibold), action: {
                                // TODO: Call the to factory setting func
                                
                            }))
                        }
                    }
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Edit") {
                        
                    }
                    .tint(.black).bold()
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
