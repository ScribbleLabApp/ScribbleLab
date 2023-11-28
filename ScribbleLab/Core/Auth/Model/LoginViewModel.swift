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
import Combine

/// ViewModel handling the login process.
///
/// This ViewModel manages user inputs for login (email and password) and
/// enables/disables the sign-in button based on certain criteria.
/// 
class LoginViewModel: ObservableObject {
    /// Published property holding the entered email.
    @Published var email = ""
    
    /// Published property holding the entered password.
    @Published var password = ""
    
    /// Published property determining if the log-in button is enabled.
    ///
    /// The button is enabled when the entered password contains at least 8 characters,
    /// the email contains an '@', and the username is not empty.
    ///
    @Published var isLogInButtonEnabled = false
    
    private var cancellables = Set<AnyCancellable>()
    
    /// Initializes the ViewModel and sets up Combine subscriptions.
    init() {
        $email.combineLatest($password)
            .sink { [weak self] email, password in
                self?.isLogInButtonEnabled = password.count >= 8 && email.contains("@")
            }
            .store(in: &cancellables)
    }
    
    /// Attempts to sign in the user with the provided credentials.
    ///
    /// This function attempts to sign in the user with the provided email and password.
    /// If successful, the user is logged in using `SLAuthService`.
    ///
    func signIn() async throws {
        try await SLAuthService.shared.logIn(withEmail: email, password: password)
    }
}
