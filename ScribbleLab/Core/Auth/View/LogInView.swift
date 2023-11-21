//
//  LogInView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 10.10.23.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth
import FirebaseCore

struct LogInView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = LoginViewModel()
    @EnvironmentObject private var vm: SignInWithGoogleModel

    
    var body: some View {
        VStack {
            Spacer()
            
            Image("logo-light-complex")
                .resizable()
                .scaledToFit()
                .frame(width: 420)
            
            VStack {
                Text("Login to access your ScribbleLabApp account.")
            }
            .font(.title3)
            .fontWeight(.medium)
            
            Spacer()
            
            VStack(spacing: 20) {
                VStack {
                    SLImageButton(text: "Continue With Google", font: .subheadline, backgroundColor: .clear, textColor: .black, cornerRadius: 10, image: Image("google"), imageWidth: 30, imageHeight: 30) {
                        vm.signInWithGoogle()
                        print("DEBUG: Sign in With Google")
                    }
                    
                    SLImageButton(text: "Continue With Apple", font: .subheadline, backgroundColor: .clear, textColor: .black, cornerRadius: 10, image: Image("apple-logo-black"), imageWidth: 30, imageHeight: 30) {
                        // TODO: Sign In With Apple (SIWA)
                        print("Sign in with apple")
                    }
                }
                
                Divider()
                    .frame(width: 359)
                
                VStack {
                    TextField("Enter your email", text: $viewModel.email)
                        .modifier(IGTextFieldModifier())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    SecureField("Enter your password", text: $viewModel.password)
                        .modifier(IGTextFieldModifier())
                    
                    /*
                    Button {
                        Task { try await viewModel.signIn() }
                    } label: {
                        Text("Log in with email")
                            .modifier(IGButtonModifier())
                    }
                    */
                    
                    SLButton(text: "Log in with email", font: .subheadline, backgroundColor: .orange, textColor: .black, cornerRadius: 10) {
                        Task { try await viewModel.signIn() }
                        print("DEBUG: sign in")
                    }
                }
                
                VStack {
                    HStack(spacing: 3) {
                        Text("No account?")
                            .foregroundStyle(.black)
                        Button {
                            dismiss()
                        } label: {
                            Text("Create one.").bold()
                                .foregroundStyle(Color.orange)
                        }
                    }
                    NavigationLink {
                        ResetPasswordView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("Forgot password?").bold().underline()
                            .foregroundStyle(Color.orange)
                    }
                    .padding(.vertical, 12)
                }
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    LogInView()
        .environmentObject(SignInWithGoogleModel())
}
