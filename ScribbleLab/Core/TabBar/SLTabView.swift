//
//  SLTabView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 07.10.23.
//

import SwiftUI

struct SLTabView: View {
    @State private var selection: Tab = .home
    @State private var isLoading = false
    
    enum Tab {
        case home
        case timetable
    }
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(Tab.home)

            TimetableView()
                .tabItem {
                    Label("Timetable", systemImage: "calendar.badge.clock")
                }
                .tag(Tab.timetable)
            }
    }
}

#Preview {
    SLTabView()
}
