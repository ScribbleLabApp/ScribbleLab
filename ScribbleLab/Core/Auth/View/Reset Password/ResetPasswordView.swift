//
//  ResetPasswordView.swift
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
