//
//  SignUpView.swift
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

struct SignUpView: View {
//    @AppStorage("isDarkMode") private var isDarkMode = false
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var presentNoAccountPopUp = false
    @State private var tourSheetIsPresented = false
    
    @State private var completeRegistrationViewIsShown = false
    
//    @State private var orientation: UIDeviceOrientation
    
    @StateObject private var vm = SignInWithGoogleModel()
    @StateObject private var viewModel = RegistrationViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                if colorScheme == .dark {
                    Image("logo-dark-complex") // FIXME: Logo: darkmode
                        .resizable()
                        .scaledToFit()
                        .frame(width: 420)
                } else {
                    Image("logo-light-complex") // FIXME: Logo: darkmode
                        .resizable()
                        .scaledToFit()
                        .frame(width: 420)
                }
                VStack {
                    Text("Kickstart your note-taking experience")
                    Text("by creating ScribbleLab account.")
                }
                .font(.title3)
                .fontWeight(.medium)
                
                Spacer()
                
                VStack(spacing: 20) {
                    VStack {
                        TextField("Enter your email", text: $viewModel.email)
                            .modifier(IGTextFieldModifier())
                            .autocorrectionDisabled()
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                        
                        SecureField("Enter your password", text: $viewModel.password)
                            .modifier(IGTextFieldModifier())
                        
                        TextField("Enter your username",text: $viewModel.username)
                            .modifier(IGTextFieldModifier())
                            .autocapitalization(.none)
                            .autocorrectionDisabled()
                        
                        SLButton(text: "Sign Up", font: .subheadline, backgroundColor: !viewModel.isSignUpButtonEnabled ? Color.darkOrange : .orange, textColor: .black, cornerRadius: 10, action: {
                            completeRegistrationViewIsShown.toggle()
                            print("DEBUG: Sign up")
                        })
                        .disabled(!viewModel.isSignUpButtonEnabled)
                        .navigationDestination(isPresented: $completeRegistrationViewIsShown) {
                            CompleteRegistartionView()
                                .navigationBarBackButtonHidden()
                                .environmentObject(viewModel)
                                .environmentObject(LoginViewModel())
                        }
                    }
                    
                    Divider()
                        .frame(width: 359)
                    VStack {
                        SLImageButton(text: "Continue With Google", font: .subheadline, backgroundColor: .clear, textColor: .black, cornerRadius: 10, image: Image("google"), imageWidth: 30, imageHeight: 30) {
                            vm.signInWithGoogle()
                        }
                        
                        SLImageButton(text: "Continue With Apple", font: .subheadline, backgroundColor: .clear, textColor: .black, cornerRadius: 10,image: Image("apple-logo-black"), imageWidth: 30, imageHeight: 30) {
                            print("DEBUG: Sign In With Apple")
                        }
                    }
                    
                    NavigationLink {
                        LogInView()
//                            .environmentObject(LoginViewModel())
                            .environmentObject(vm)
                            .navigationBarBackButtonHidden()
                    } label: {
                        HStack(spacing: 4) {
                            Text("Already have an account?")
                            Text("Log In").bold()
                                .foregroundStyle(.orange)
                        }
                        .tint(.primary)
                        
                    }
                }
                
                Spacer()
                
                VStack {
                    Text("By continuing I agree with ScribbleLabApp's ") + Text("[Terms of Use](https://github.com/ScribbleLabApp/ScribbleLab/blob/main/LICENSE_AGREEMENT.md)").underline()
                    Text("and ") + Text(" [Privacy Policy](https://github.com/ScribbleLabApp/ScribbleLab/blob/main/PrivacyPolicy.md).").underline()
                }
                .tint(.primary)
                .font(.headline)
                .fontWeight(.medium)
            }
            .padding()
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

#Preview {
    SignUpView()
}
