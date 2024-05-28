//
//  SLOTP+2FA_ConfigView.swift
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
//import SwiftRUI
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth
import FirebaseCore
import iPhoneNumberField

struct SLOTP_2FA_ConfigView: View {
    @State private var phoneNumber = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(.personIllustartionOrange)
                .frame(width: 600, height: 700)
                .padding(10)
            
            Text("Enter your Phone Number")
                .font(.title)
                .fontWeight(.bold)
            
            VStack(spacing: 2) {
                Text("To set 2FA up you need to give us a valide")
                Text("phone number in order to get 2FA Codes or")
                Text("to sign in via phone number")
            }
            .padding(.vertical, 4)
            .font(.headline)
            .fontWeight(.medium)
            
            VStack(spacing: 10) {
                iPhoneNumberField("+49 0000-0000", text: $phoneNumber)
                    .flagHidden(false)
                    .prefixHidden(false)
                    .flagSelectable(true)
                    .clearButtonMode(.always)
                    .maximumDigits(13)
                    .accentColor(Color.orange)
                    .padding(.horizontal, 8)
                    .frame(width: 356, height: 50, alignment: .center)
                    .background {
                        RoundedRectangle(cornerRadius: 15)
                            .strokeBorder(Color(red: 194/255, green: 194/255, blue: 194/255), lineWidth: 0.5)
                        Color.gray.opacity(0.02)
                    }
                    .padding(12)
                
                Button {
                    // TODO: Check if the phone number is valide and send request to FirebaseAuth and Firestore
                    
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
            
        }
    }
}

#Preview {
    SLOTP_2FA_ConfigView()
}
