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
