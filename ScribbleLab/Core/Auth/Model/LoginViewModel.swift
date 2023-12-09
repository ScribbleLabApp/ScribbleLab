//
//  LoginViewModel.swift
//  ScribbleLabAuth
//
//  Copyright (c) 2023 - 2024 ScribbleLabApp.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
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
