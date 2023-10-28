//
//  RegistrationViewModel.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 21.10.23.
//

import Foundation

@MainActor
class RegistrationViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    
    /*
    @Published var isSignUpButtonIsEnabled: Bool {
        if password.isEmpty && password.count < 6 && email.isEmpty && !email.contains("@") && username.isEmpty {
            return false
        } else {
            return true
        }
    }
     */
    
    func createUser() async throws {
        try await SLAuthService.shared.createUser(email: email, password: password, username: username)
        
        username = ""
        password = ""
        email = ""
    }
}
