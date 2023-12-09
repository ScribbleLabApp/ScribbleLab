//
//  SLOTP+2FAView.swift
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
import SwiftRUI
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth
import FirebaseCore
import AlertToast

struct SLOTP_2FAView: View {
    @State private var otpcode = ""
    var body: some View {
        VStack {
            Spacer()
            
            Image(.personIllustartionOrange)
                .frame(width: 600, height: 700)
                .padding(10)
            
            Text("Enter your 2FA-Code")
                .font(.title)
                .fontWeight(.bold)
            
            VStack(spacing: 2) {
                Text("We sent you a SMS in that")
                Text("you can find your OTP Code")
            }
            .padding(.vertical, 4)
            .font(.headline)
            .fontWeight(.medium)
            
            VStack(spacing: 10) {
                OTPTextFieldView(numberOfFields: 6)
                    .padding()
                
                Button {
            
                } label: {
                    Text("Verify")
                        .modifier(IGButtonModifier())
                }
            }
            .padding()
            
            Button {
                
            } label: {
                Text("Cancel").bold()
                    .padding()
                    .foregroundStyle(.orange)
            }
            
            Spacer()
        }
    }
}

#Preview {
    SLOTP_2FAView()
}
