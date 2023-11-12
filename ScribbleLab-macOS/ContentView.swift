//
//  ContentView.swift
//  ScribbleLab-macOS
//
//  Created by Nevio Hirani on 10.11.23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @EnvironmentObject var viewModel = ContentViewModel()
    
    var body: some View {
        Group {
            if $viewModel.userSession == nil {
                SignUpView()
            } else if let currentUser = viewModel.currentUser { // viewModel.currentUser != nil
               SLSideBarView()
            }
        }
    }
}

#Preview {
    ContentView()
}
