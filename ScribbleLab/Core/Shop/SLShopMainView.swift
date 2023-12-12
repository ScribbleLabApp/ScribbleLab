//
//  SLShopMainView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 10.12.23.
//

import SwiftUI

struct SLShopMainView: View {
    var body: some View {
        VStack {
            NavigationStack {
                Text("Welcome to the store")
                
                .navigationTitle("Store")
                .navigationBarTitleDisplayMode(.large)
            }
        }
    }
}

#Preview {
    SLShopMainView()
}
