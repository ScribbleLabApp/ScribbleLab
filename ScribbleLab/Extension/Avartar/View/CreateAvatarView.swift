//
//  CreateAvatarView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 17.02.24.
//

import SwiftUI

struct CreateAvatarView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        // TODO: save avartar
                        dismiss()
                    } label: {
                        Text("Done")
                            .fontWeight(.semibold)
                    }
                }
            }
            .navigationTitle("Create Avartar")
            .navigationBarTitleDisplayMode(.inline)
        }
        .tint(.orange)
    }
}

#Preview {
    NavigationStack {
        CreateAvatarView()
    }
}
