//
//  SLHelpView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 10.10.23.
//

import SwiftUI

struct SLHelpView: View {
    var body: some View {
        NavigationStack {
            Text("Help me pls")
                .navigationTitle("Help")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SLHelpView()
}
