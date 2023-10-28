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
                
                Divider()
                    .frame(width: 359)
                
                VStack {
                    TextField("Enter your email", text: $viewModel.email)
                        .modifier(IGTextFieldModifier())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    SecureField("Enter your password", text: $viewModel.password)
                        .modifier(IGTextFieldModifier())
                                        
                    Button {
                        Task { try await viewModel.signIn() }
                    } label: {
                        Text("Log in with email")
                            .modifier(IGButtonModifier())
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
