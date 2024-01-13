//
//  ContentView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 06.10.23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()

    var body: some View {
        Group {
            if viewModel.userSession == nil { 
                // FIXME: Old: $viewModel.userSession
                SignUpView()
            } else if viewModel.userSession != nil {
            // FIXME: else if let currentUser = viewModel.currentUser
               SLSideBarView()
            }
        }
    }
}

#Preview {
    ContentView()
}
