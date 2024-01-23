//
//  SLDisplayStyleButton.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 23.01.24.
//

import SwiftUI

struct SLDisplayStyleButton: View {
    @Binding var displayStyle: SortOption
    
    var body: some View {
        Button {
            displayStyle.toggle()
        } label: {
            Image(systemName: displayStyle.image)
                .tint(.orange)
        }
    }
}
