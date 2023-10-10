//
//  SLInfoView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 10.10.23.
//

import SwiftUI

struct SLInfoView: View {
    var body: some View {
        NavigationStack {
            Text("Info")
                .navigationTitle("Info")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SLInfoView()
}
