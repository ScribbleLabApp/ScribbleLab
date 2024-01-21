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
            ContentUnavailableView("Store is not available", systemImage: "wifi.exclamationmark", description: Text("Check your connection and try later again."))
            .navigationTitle("Store")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    SLShopMainView()
}
