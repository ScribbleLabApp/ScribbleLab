//
//  SLOtherSettings.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 17.10.23.
//

import SwiftUI

struct SLOtherSettings: View {
    var body: some View {
        NavigationStack {
            List {
                Section() {
                    Toggle(isOn: .constant(true)) {
                        Text("Store")
                    }
                } header: {
                    Text("Manage Features")
                } footer: {
                    Text("To keep a clean overview of your app you can disable features you don't use that often.")
                }
            }
                .navigationTitle("Features")
        }
    }
}

#Preview {
    SLOtherSettings()
}
