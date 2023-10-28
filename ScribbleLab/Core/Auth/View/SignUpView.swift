//
//  SignUpView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 08.10.23.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth
import FirebaseCore

struct SignUpView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    @State private var presentNoAccountPopUp = false
    @State private var tourSheetIsPresented = false
    
    @State private var completeRegistrationViewIsShown = false
    
//    @State private var orientation: UIDeviceOrientation
    
    @StateObject private var vm = SignInWithGoogleModel()
    @StateObject var viewModel = RegistrationViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Image("logo-light-complex")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 420)
                
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
                        
                        SecureField("Enter your password", text: $viewModel.password)
                            .modifier(IGTextFieldModifier())
                        
                        TextField("Enter your username",text: $viewModel.username)
                            .modifier(IGTextFieldModifier())
                                            
                        Button {
                            completeRegistrationViewIsShown.toggle()
                        } label: {
                            Text("Sign Up")
                                .modifier(IGButtonModifier())
                                .disabled(viewModel.password.count < 6)
                        }
                        .navigationDestination(isPresented: $completeRegistrationViewIsShown) {
                            CompleteRegistartionView()
                                .environmentObject(RegistrationViewModel())
                                .navigationBarBackButtonHidden()
                        }
                    }
                    
                    Divider()
                        .frame(width: 359)
                    VStack {
                        Button {
                            vm.signInWithGoogle()
                        } label: {
                            HStack {
                                Image("google")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                
                                Text("Continue with Google")
                                    .padding(.horizontal, 60)
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.black)
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 13)
                            .background {
                                RoundedRectangle(cornerRadius: 13)
                                    .fill(Color(red: 248/255, green: 248/255, blue: 248/255))
                                    .strokeBorder(Color(red: 194/255, green: 194/255, blue: 194/255), lineWidth: 0.5)
                            }
                        }
                        
                        Button {
                            
                        } label: {
                            HStack {
                                Image("apple-logo-black")
                                    .resizable()
                                    .frame(width: 36, height: 35)
                                
                                Text("Continue with Apple")
                                    .padding(.horizontal, 60)
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.black)
                            }
                            .padding(.horizontal, 17)
                            .padding(.vertical, 13)
                            .background {
                                RoundedRectangle(cornerRadius: 13)
                                    .fill(Color(red: 248/255, green: 248/255, blue: 248/255))
                                    .strokeBorder(Color(red: 194/255, green: 194/255, blue: 194/255), lineWidth: 0.5)
                            }
                        }
                    }
                    
                    NavigationLink {
                        LogInView()
                            .environmentObject(LoginViewModel())
                            .environmentObject(SignInWithGoogleModel())
                            .navigationBarBackButtonHidden()
                    } label: {
                        HStack(spacing: 4) {
                            Text("Already have an account?")
                            Text("Log In").bold()
                                .foregroundStyle(.orange)
                        }
                        .foregroundStyle(.black)
                        
                    }
                }
                
                Spacer()
                
                VStack {
                    Text("By continuing I agree with ScribbleLabApp's ") + Text("[Terms of Use](https://github.com/ScribbleLabApp/ScribbleLab/blob/main/LICENSE_AGREEMENT.md)").underline()
                    Text("and ") + Text("[Privacy Policy](https://github.com/ScribbleLabApp/ScribbleLab/blob/main/PrivacyPolicy.md).").underline()
                }
                .tint(.black)
                .font(.headline)
                .fontWeight(.medium)
            }
            .padding()
        }
    }
}

#Preview {
    SignUpView()
}
