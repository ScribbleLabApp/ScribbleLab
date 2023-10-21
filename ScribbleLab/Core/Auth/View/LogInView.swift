//
//  LogInView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 08.10.23.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth
import FirebaseCore

struct LogInView: View {
    @State private var presentNoAccountAlert = false
    @State private var tourSheetIsPresented = false
    @StateObject private var vm = SignInWithGoogleModel()
    @StateObject var viewModel = LoginViewModel()
    
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
                        TextField("Enter your email", text: $viewModel.email)
                            .modifier(IGTextFieldModifier())
                            
                        SecureField("Enter your password", text: $viewModel.password)
                            .modifier(IGTextFieldModifier())
                    }
                    .frame(width: 500, height: 200)
                    
                    // forgot password
                    Button {
                        print("Forgot Password")
                    } label: {
                        Text("Forgot Password?")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .padding(.top)
                            .padding(.trailing, 28)
                            .foregroundStyle(Color.black)
                    }
//                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .frame(width: 100, height: 100 ,alignment: .trailing)
                                    
                    // MARK: log-in
                    Button {
                        Task { try await viewModel.signIn() }
                    } label: {
                        Text("Login")
                            .modifier(IGButtonModifier())
                    }
                    .padding(.vertical)
                    
                    // Custom Divider
                    HStack {
                        Rectangle()
                            .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                        
                        Text("OR")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Rectangle()
                            .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                    }
                    .foregroundColor(.gray)
                    
                    // MARK: - other methods
                    /// Other sign-in methods
                    /// The user can decide between our Sign In func, Sign in with google and sign in with apple
                    ///
                    //  MARK: - Sign-In with Google
                    GoogleSignInButton(scheme: .light, style: .standard, state: .normal) {
                        vm.signInWithGoogle()
                    }
                    .frame(width: 360, height: 44)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                    Button {
//                        vm.signInWithGoogle()
//                    } label: {
//                        Text("Continue with Google")
//                            .modifier(IGButtonModifier())
//                    }
//                    .font(.subheadline)
//                    .fontWeight(.semibold)
//                    .frame(width: 360, height: 44)
//                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    //  MARK: - Sign-In with Apple
//                    SignInWithAppleButton(
//                        onRequest: { request in
//
//                        },
//                        onCompletion: { result in
//
//                        }
//                    )
                    
                    // MARK: - no account
                    Button {
                        presentNoAccountAlert.toggle()
                    } label: {
                        Text("Continue without an account")
                            .modifier(IGButtonModifier())
                    }
                    .alert(isPresented: $presentNoAccountAlert) {
                        Alert(title: Text("Important message"), message: Text("You can continue without an account but some features will be unavailable for you. You can create one later in the Settings"), primaryButton: .default(Text("Cancel"), action: {
                            print("Cancel") // nothing needs to do here
                        }), secondaryButton: .destructive(Text("Confirm").fontWeight(.semibold), action: {
                                // calls the tour guide sheet
                                tourSheetIsPresented.toggle()
                            }))
                        }
                    .sheet(isPresented: $tourSheetIsPresented, content: {
                        TourViewBeginning()
                    })
                    .padding()
                    
                    Spacer()
                                    
                    // sign-up link
                    Divider()
                                    
                    NavigationLink {
                        RegistrationView()
                            //.environmentObject(RegistrationViewModel())
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        HStack(spacing: 3) {
                            Text("Don't have an account?")
                            Text("Sign Up")
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
    LogInView()
}
