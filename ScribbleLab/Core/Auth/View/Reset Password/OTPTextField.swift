//
//  OTPTextField.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 29.10.23.
//

import SwiftUI

struct OTPTextField: View {
    @State var otpCode = ""
    var body: some View {
        TextField("", text: $otpCode)
            .frame(width: 48, height: 48)
            .font(.subheadline)
            .multilineTextAlignment(.center)
            .padding(5)
            .cornerRadius(10)
            .background {
                RoundedRectangle(cornerRadius: 15)
                .strokeBorder(Color(red: 194/255, green: 194/255, blue: 194/255), lineWidth: 0.5)
        }
    }
}

#Preview {
    OTPTextField()
}
