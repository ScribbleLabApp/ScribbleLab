//
//  LogInView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 08.10.23.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct LogInView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            Image(.backgroundElementDigital) // FIXME: Find another image
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
                    Image(.documentation)
                        .resizable()
                        .frame(width: 150, height: 150)
                    VStack {
                        // FIXME: Image "moves" away when clicking on a TextField
                        TextField("Enter your email", text: $email)
                            .modifier(IGTextFieldModifier())
                            
                        SecureField("Enter your password", text: $password)
                            .modifier(IGTextFieldModifier())
                    }
                    .frame(width: 500, height: 200)
                    
                    // forgot password
                    // FIXME: Fix alignment
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
                                    
                    // log-in
                    Button {
                        print("Handle Login")
                    } label: {
                        Text("Login")
                            .modifier(IGButtonModifier())
                    }
                    .padding(.vertical)
                    
                    // Custome Divider
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
                    
                    //  MARK: - Sign-In with Apple
                    //  FIXME: Deadline till RC Release
                    
            }
        }
    }
}

#Preview {
    LogInView()
}
