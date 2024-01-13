//
//  ProfileView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 08.10.23.
//

import SwiftUI

struct ProfileView: View {
    /// - View Properties
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    /// - Action Properties:
    @State private var signOutWarningIsPresented = false
    @State private var deleteAccountWarning = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        NavigationLink {
                            SubscriptionView()
                        } label: {
                            Text("Subscription type")
                        }
                        
                        HStack {
                            Text("Member since")
                            
                            Spacer()
                            
                            Text("01/01/2024")
                                .foregroundStyle(.secondary)
                        }
                    } header: {
                        Text("Membershipinfo")
                    }
                    
                    Section {
                        HStack {
                            Text("Username")
                            
                            Spacer()
                            
                            Text("Test")
                                .foregroundStyle(.secondary)
                        }
                        
                        HStack {
                            Text("Linked via")
                            
                            Spacer()
                            
                            Text("ScribbleLabApp")
                                .foregroundStyle(.secondary)
                        }
                        
                        HStack {
                            Text("E-Mail")
                            
                            Spacer()
                            
                            Text("test01@gmail.com")
                                .tint(.secondary)
                        }
                    } header: {
                        Text("Account-Information")
                    }
                    
                    Section {
                        Button("Change Password") {
                            print("DEBUG: Change Password method called")
                        }
                        
                        Button("Change Email") {
                            print("DEBUG: Change Email method called")
                        }
                        
                        Button("Change Username") {
                            print("DEBUG: Change Username method called")
                        }
                    } header: {
                        Text("Account-Settings")
                    }
                    
                    Section {
                        Button("Configure 2FA") {
                            print("DEBUG: 2FA Configuration method called")
                        }
                    } header: {
                        Text("Account-Safety")
                    }
                    
                    Section {
                        Button("Terms of Use") {
                            print("DEBUG: TermsOfUsed requested")
                        }
                        
                        Button {
                            signOutWarningIsPresented.toggle()
                        } label: {
                            Text("Sign Out")
                        }
                        .confirmationDialog(
                            "Log out of ScribbleLab?",
                            isPresented: $signOutWarningIsPresented
                        ) {
                            Button("Sign Out", role: .destructive) {
                                SLAuthService.shared.signOut()
                            }
                        } message: {
                            Text("You won't be able to use this App without an account. All your documets are safely syncronised in your Cloud.")
                        }
                        
                        Button("Delete Account") {
                            deleteAccountWarning.toggle()
                        }
                        .tint(.red)
                        .confirmationDialog(
                            "Permanently delete your ScribbleLabAccount?",
                            isPresented: $deleteAccountWarning
                        ) {
                            Button("Delete Account", role: .destructive) {
                                
                            }
                        } message: {
                            Text("You cannot undo this action.")
                        }
                    }
                }
            }
            .navigationTitle("Account-Information")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                        print("DEBUG: Screen dismissed")
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
