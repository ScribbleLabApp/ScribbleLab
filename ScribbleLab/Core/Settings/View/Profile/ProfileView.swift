//
//  ProfileView.swift
//  ScribbleLab
//
//  Copyright (c) 2023 - 2024 ScribbleLabApp.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import SwiftUI

struct ProfileView: View {
    @State private var signOutWarningIsPresented = false
    @State private var deleteAccountWarning = false
    
    var body: some View {
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
                        
                        Text("test0101") // FIXME: Fix force unwrapping
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
                        
                        Text("test@gmail.com")
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
                    NavigationLink {
                        IntegrationsView()
                    } label: {
                        Text("Integartions")
                    }
                } header: {}
                
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
    }
}

#Preview {
    NavigationStack {
        ProfileView()
    }
}
