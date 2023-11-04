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
    
    /// - Action Properties:
    @State private var signOutWarningIsPresented = false
    
    var body: some View {
        NavigationStack {
            VStack {
                // MARK: Profile headder
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
                        }
                    }
                    Text("Test User")
                        .font(.title2).bold()
                    
                    Text("test@gmail.com")
                        .tint(Color(.darkGray))
                }
                
                // MARK: Options
//                List {
//                    Section {
//                        Button {
//                            signOutWarningIsPresented.toggle()
//                        } label: {
//                            Text("Sign Out")
//                                .foregroundStyle(.red)
//                        }
//                        .alert(isPresented: $signOutWarningIsPresented) {
//                            Alert(title: Text("Important message"), message: Text("Do you really want to sign out? You'll be not able to use this app without signing in"), primaryButton: .default(Text("Cancel"), action: {}), secondaryButton: .destructive(Text("Confirm").fontWeight(.semibold), action: {
//                                // TODO: Call the to factory setting func
//                                SLAuthService.shared.signOut()
//                            }))
//                        }
//                    } header: {
//
//                    } footer: {
//
//                    }
//                }
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
