//
//  LogInView.swift
//  ScribbleLabAuth
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
                    
                    SLButton(text: "Log in with email", font: .subheadline, backgroundColor: !viewModel.isLogInButtonEnabled ? Color.darkOrange : .orange, textColor: .black, cornerRadius: 10) {
                        Task { try await viewModel.signIn() }
                        print("DEBUG: sign in")
                    }
                    .disabled(!viewModel.isLogInButtonEnabled)
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
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

#Preview {
    LogInView()
        .environmentObject(SignInWithGoogleModel())
}
