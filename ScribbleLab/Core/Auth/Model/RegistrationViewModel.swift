//
//  RegistrationViewModel.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 21.10.23.
//

import Foundation
import Combine

/// ViewModel handling the registration process.
///
/// This ViewModel manages user inputs for registration (username, email, password)
/// and enables/disables the sign-up button based on certain criteria.
///
@MainActor
class RegistrationViewModel: ObservableObject {
    /// Published property holding the entered username.
    @Published var username = ""
    
    /// Published property holding the entered email.
    @Published var email = ""
    
    /// Published property holding the entered password.
    @Published var password = ""
    
    /// Published property determining if the sign-up button is enabled.
    ///
    /// The button is enabled when the entered password contains at least 8 characters,
    /// the email contains an '@', and the username is not empty.
    ///
    @Published var isSignUpButtonEnabled = false
    
    private var cancellables = Set<AnyCancellable>()
    
    /// Initializes the ViewModel and sets up Combine subscriptions.
    init() {
        $username.combineLatest($email, $password)
            .sink { [weak self] username, email, password in
                self?.isSignUpButtonEnabled = password.count >= 8 && email.contains("@") && !username.isEmpty
            }
            .store(in: &cancellables)
    }
    
    /// Attempts to create a new user account with the provided credentials.
    ///
    /// If successful, it clears the entered username, password, and email.
    ///
    func createUser() async throws {
        try await SLAuthService.shared.createUser(email: email, password: password, username: username)
        
        // Resetting the values after user creation
        username = ""
        password = ""
        email = ""
    }
}
