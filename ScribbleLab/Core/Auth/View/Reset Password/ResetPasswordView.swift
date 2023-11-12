//
//  ResetPasswordView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 27.10.23.
//

import SwiftUI
import SwiftRUI
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth
import FirebaseCore


struct ResetPasswordView: View {
    @Environment(\.dismiss) var dismiss
    @State private var email = ""
    @State private var alertIsShown = false
    @State private var errString: String?
    
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
                TextField("Enter your email", text: $email)
                    .modifier(IGTextFieldModifier())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                Button {
                    SLAuthService.resetPassword(email: email) { (result) in
                        switch result {
                        case .failure(let error):
                            self.errString = error.localizedDescription
                        case .success( _):
                            break
                        }
                        self.alertIsShown = true
                    }
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
            
            .alert(isPresented: $alertIsShown, content: {
                Alert(title: Text("Password reset"), message: Text(self.errString ?? "Success. Reset Email send successfuly. Check your emails."), dismissButton: .default(Text("OK")) {
                    self.dismiss()
                })
            })
        }
    }
}

#Preview {
    ResetPasswordView()
}
