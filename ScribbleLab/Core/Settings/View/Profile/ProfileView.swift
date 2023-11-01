//
//  ProfileView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 08.10.23.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @State private var signOutWarningIsPresented = false
    var body: some View {
        NavigationStack {
            Text("Hello TEST USER")
                .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
            
            List {
                Section {
                    Button {
                        signOutWarningIsPresented.toggle()
                    } label: {
                        Text("Sign Out")
                            .foregroundStyle(.red)
                    }
                    .alert(isPresented: $signOutWarningIsPresented) {
                        Alert(title: Text("Important message"), message: Text("Do you really want to sign out? You'll be not able to use this app without signing in"), primaryButton: .default(Text("Cancel"), action: {}), secondaryButton: .destructive(Text("Confirm").fontWeight(.semibold), action: {
                                // TODO: Call the to factory setting func
                            SLAuthService.shared.signOut()
                            }))
                        }
                } header: {
                    
                } footer: {
                    
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
