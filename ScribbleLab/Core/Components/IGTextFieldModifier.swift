//
//  IGTextFieldModifier.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 09.10.23.
//

import SwiftUI

struct IGTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            /*.font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
             */
            .font(.subheadline)
            .padding(12)
            .cornerRadius(10)
            .background {
                RoundedRectangle(cornerRadius: 15)
                .strokeBorder(Color(red: 194/255, green: 194/255, blue: 194/255), lineWidth: 0.5)
            }
            .frame(width: 359)
    }
}
