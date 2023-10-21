//
//  RegistrationViewModel.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 21.10.23.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    
    func createUser() async throws {
        try await SLAuthService.shared.createUser(email: email, password: password, username: username)
        
        username = ""
        password = ""
        email = ""
    }
}
