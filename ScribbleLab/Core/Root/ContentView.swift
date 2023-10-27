//
//  ContentView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 06.10.23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @StateObject var registrationViewModel = RegistrationViewModel()

    var body: some View {
        Group {
            if $viewModel.userSession == nil { // FIXME: remove '$'
                SignUpView()
                    .environmentObject(SignInWithGoogleModel())
                    .environmentObject(RegistrationViewModel())
            } else if let currentUser = viewModel.currentUser {
               SLSideBarView()
            }
        }
    }
}

#Preview {
    ContentView()
}
