//
//  ProfileView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 08.10.23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            Text("Hello TEST USER")
                .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ProfileView()
}
