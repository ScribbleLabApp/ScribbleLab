//
//  SLHelpView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 10.10.23.
//

import SwiftUI

struct SLHelpView: View {
    @Environment(\.openURL) var openURL
    
    var body: some View {
        NavigationStack {
            List {
                Section() {
                    Button {
                        
                    } label: {
                        Label("Report a bug",systemImage: "ladybug")
                    }
                    .onTapGesture {
                        openURL(URL(string: "https://github.com/ScribbleLabApp/issues")!)
                    }
                    .tint(.black)
                } header: {
                    Text("")
                } footer: {
                    Text("")
                }
            }
                .navigationTitle("Help")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SLHelpView()
}
