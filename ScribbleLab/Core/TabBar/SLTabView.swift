//
//  SLTabView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 07.10.23.
//

import SwiftUI

struct SLTabView: View {
    @State private var selectedIndex = 0
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            HomeView()
                .onAppear {
                    selectedIndex = 0
                }
                .tabItem {
                    Image(systemName: "house")
                } .tag(0)
            
            TimetableView()
                .onAppear {
                    selectedIndex = 1
                }
                .tabItem {
                    Image(systemName: "")
                } .tag(1)
        }
        .tint(.black)
    }
}

#Preview {
    SLTabView()
}
