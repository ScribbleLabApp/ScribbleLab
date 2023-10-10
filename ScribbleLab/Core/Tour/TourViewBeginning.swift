//
//  TourViewBeginning.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 10.10.23.
//

import SwiftUI

struct TourViewBeginning: View {
    var body: some View {
        NavigationStack {
            Text("Welcome to Scribble Lab")
                .navigationTitle("Get started with Scribble Lab")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    TourViewBeginning()
}
