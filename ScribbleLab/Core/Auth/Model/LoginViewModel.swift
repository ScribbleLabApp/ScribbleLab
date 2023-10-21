//
//  LoginViewModel.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 21.10.23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreSwift
import Firebase

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        try await SLAuthService.shared.logIn(withEmail: email, password: password)
    }
}
