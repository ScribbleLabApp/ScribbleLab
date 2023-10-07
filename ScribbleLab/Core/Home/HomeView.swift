//
//  HomeView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 07.10.23.
//

import SwiftUI

struct HomeView: View {
    @State private var notificationSheetisPresented = false
    @State private var settingsViewSheetisPresented = false
    
    var body: some View {
        NavigationStack {
            Text("Hi")
                .navigationTitle("Documents")
                .navigationBarTitleDisplayMode(.large)
            
                .toolbar {
                    // FIXME: Show NavigationBar
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(systemName: "sidebar.left")
                    }
                    
                    // FIXME: Show NotificationSheet
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Image(systemName: "bell")
                    }
                    
                    // FIXME: Show Settings sheet
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Image(systemName: "gearshape")
                    }
                }
        }
    }
}

#Preview {
    HomeView()
}
