//
//  ColorPickerView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 25.11.23.
//

import SwiftUI

// swiftlint:disable length violation
struct ColorPickerView: View {
    let colors = [Color.red, Color.yellow, Color.orange, Color.green, Color.blue, Color.purple, Color.black, Color.gray]
    
    @Binding var selectedColor: Color
    
    var body: some View {
        HStack {
            ForEach(colors, id: \.self) { color in
                Image(systemName: selectedColor == color ? Constants.Icons.recordCircleFill : Constants.Icons.circleFill)
                    .foregroundStyle(color)
                    .font(.system(size: 16))
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedColor = color
                    }
            }
        }
    }
}

#Preview {
    ColorPickerView(selectedColor: .constant(.blue))
}
