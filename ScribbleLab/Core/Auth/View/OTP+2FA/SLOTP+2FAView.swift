//
//  SLOTP+2FAView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 14.11.23.
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
                    Text("Next")
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
