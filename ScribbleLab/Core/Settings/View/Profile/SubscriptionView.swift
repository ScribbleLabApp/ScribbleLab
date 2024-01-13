//
//  SubscriptionView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 13.01.24.
//

import SwiftUI

struct SubscriptionView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    HStack {
                        Text("Membership type")
                        
                        Spacer()
                        
                        Text("none")
                            .foregroundStyle(.secondary)
                    }
                } header: {
                    Text("Membershipinfo")
                } footer: {
                    Text("You can learn more about how to manage subscriptions on our [help page](https://github.com/ScribbleLabApp/ScribbleLab).")
                }
            }
            .navigationTitle("Subscription type")
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Subscribe") {
                        print("DEBUG: Subscription handler called")
                    }
                }
            }
        }
    }
}

#Preview {
    SubscriptionView()
}
