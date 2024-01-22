//
//  SegmentedPicker.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 22.01.24.
//

import SwiftUI

struct SegmentedPicker: View {
    @Binding var selection: DocumentSortOptionFavourite
    
    var body: some View {
        Picker("Sort By", selection: $selection) {
            ForEach(DocumentSortOptionFavourite.allCases) { option in
                Text(option.rawValue).tag(option)
            }
        }
        .pickerStyle(.segmented)
    }
}
