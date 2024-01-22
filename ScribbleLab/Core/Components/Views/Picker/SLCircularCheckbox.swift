//
//  SLCircularCheckbox.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 22.01.24.
//

import SwiftUI

struct SLCircularCheckbox: View {
    @Binding var selectedTheme: ThemeState
    let onTap: () -> Void
    
    var theme: ThemeState
    var selectionColor: Color = Color.orange
    var size: CGFloat = 20
    
    var isSelected: Bool {
        selectedTheme == theme
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: .circular)
                .stroke(isSelected ? Color.clear : Color.gray, lineWidth: 2)
                .background(isSelected ? Color.orange : Color.clear)  // isSelected ? selectionColor
                .frame(width: size, height: size) // alignment: .center
                .clipShape(Circle())
                .onTapGesture {
                    withAnimation {
                       onTap()
                    }
                }
        }
    }
}
