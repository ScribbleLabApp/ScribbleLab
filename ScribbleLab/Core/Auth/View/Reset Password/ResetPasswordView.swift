//
//  ResetPasswordView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 27.10.23.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth
import FirebaseCore


struct ResetPasswordView: View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject var resetPasswordModel = ResetPasswordModel()
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(.personIllustartionOrange)
                .frame(width: 600, height: 700)
                .padding(10)
            
            Text("Forgot your Password?")
                .font(.title)
                .fontWeight(.bold)
            
            VStack(spacing: 2) {
                Text("We'll send you an email with instructions")
                Text("on how to reset it.")
            }
            .padding(.vertical, 4)
            .font(.headline)
            .fontWeight(.medium)
            
            VStack(spacing: 10) {
                TextField("Enter your email", text: $resetPasswordModel.email) // $email
                    .modifier(IGTextFieldModifier())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                Button {
                    resetPasswordModel.resetPasswordHandler()
                } label: {
                    Text("Next")
                        .modifier(IGButtonModifier())
                }
            }
            .padding()
            
            Button {
                dismiss()
            } label: {
                Text("Cancel").bold()
                    .padding()
                    .foregroundStyle(.orange)
            }
            
            Spacer()
            
                .alert(isPresented: $resetPasswordModel.alertIsShown, content: {
                    Alert(title: Text("Password reset"), message: Text(self.resetPasswordModel.errString ?? "Success. Reset Email send successfuly. Check your emails."), dismissButton: .default(Text("OK")) {
                    self.dismiss()
                })
            })
        }
    }
}

#Preview {
    ResetPasswordView()
}
