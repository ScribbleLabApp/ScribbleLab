//
//  ContentView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 06.10.23.
//

import SwiftUI

struct ContentView: View {
    /// ViewModels that keep track
    @StateObject var viewModel = ContentViewModel()
    @StateObject var registrationViewModel = RegistrationViewModel()

    var body: some View {
//        Group {
//            if viewModel.userSession == nil {
//                LogInView()
//                    .environmentObject(registrationViewModel)
//            } else if let currentUser = viewModel.currentUser {
//               SLSideBarView()
//            }
//        }
        SLSideBarView()
    }
}

#Preview {
    ContentView()
}
