//
//  RegistrationView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 10.10.23.
//

import SwiftUI

struct RegistrationView: View {
//    @State private var email = ""
//    @State private var password = ""
//    @State private var fullname = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel

    
    var body: some View {
        ZStack {
            Image(.backgroundElementDigital)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .overlay {
                    Rectangle()
                        .foregroundColor(.black)
                        .opacity(0.15) // 0.3
                        .ignoresSafeArea()
                }
                .blur(radius: 3.0)
            VStack {
                Spacer()
                
                Image(.documentation)
                    .resizable()
                    .frame(width: 150, height: 150)
                
                VStack {
                    // FIXME: Image "moves" away when clicking on a TextField
                    TextField("Enter your email", text: $viewModel.email)
                        .modifier(IGTextFieldModifier())
                        
                    // FIXME: Add strength meter and password requirements
                    #warning("Create new View for password")
                    SecureField("Enter your password", text: $viewModel.password)
                        .modifier(IGTextFieldModifier())
                    
                    TextField("Enter your username", text: $viewModel.username)
                        .modifier(IGTextFieldModifier())
                }
                .frame(width: 500, height: 200)
                
                // log-in
                Button {
                    print("Create account and show the tour")
                } label: {
                    Text("Sign-up")
                        .modifier(IGButtonModifier())
                }
                .padding(.vertical)
                
                Spacer()
                                
                // sign-up link
                Divider()
                                
                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 3) {
                        Text("Already have an account?")
                        Text("Login")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                    .foregroundStyle(Color.black)
                }
                .padding(.vertical)

            }
        }
    }
}

#Preview {
    RegistrationView()
}
