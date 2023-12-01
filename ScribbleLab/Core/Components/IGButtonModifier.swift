//
//  IGButtonModifier.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 09.10.23.
//

import SwiftUI

struct IGButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.black)
            .frame(width: 360, height: 44)
            .background(Color.orange)
            .cornerRadius(10)
    }
}
