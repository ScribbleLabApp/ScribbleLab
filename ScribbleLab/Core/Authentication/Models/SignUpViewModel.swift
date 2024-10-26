//
//  SignUpViewModel.swift
//  ScribbleLab · Authentication
//
//  Copyright (c) 2024 ScribbleLabApp LLC. - All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//  1. Redistributions of source code must retain the above copyright notice, this
//     list of conditions and the following disclaimer.
//
//  2. Redistributions in binary form must reproduce the above copyright notice,
//     this list of conditions and the following disclaimer in the documentation
//     and/or other materials provided with the distribution.
//
//  3. Neither the name of the copyright holder nor the names of its
//     contributors may be used to endorse or promote products derived from
//     this software without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
//  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
//  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
//  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
//  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
//  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
//  OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
//  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

import Combine
import Foundation
import Firebase
import FirebaseAuth
import ScribbleFoundation

class SignUpViewModel: ObservableObject {
    
    /// Published property holding the entered email.
    @Published var email: String = ""
    
    /// Published property holding the entered password.
    @Published var password: String = ""
    
    /// Published property holding the entered username.
    @Published var username: String = ""
    
    /// Published property determining if the sign-up button is enabled.
    ///
    /// The button is enabled when the entered password contains at least 8 characters,
    /// the email contains an '@', and the username is not empty.
    ///
    @Published var isSignUpButtonEnabled = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setUpValidation()
    }
    
    // That's the most ugliest code I've ever written - please don't blame me
    // I'm just tired - Thank you for your understanding!
    private func setUpValidation() {
        Publishers.CombineLatest3($email, $password, $username)
            .sink { [weak self] email, password, username in
                guard let self = self else { return }
                
                let isInputValid = self.validateInput(
                    email: email,
                    password: password,
                    username: username
                )
                
                if isInputValid {
                    Task {
                        if let isAvailable = try? await self.checkUsernameAvailability(for: username) {
                            DispatchQueue.main.async {
                                self.isSignUpButtonEnabled = isAvailable
                            }
                        }
                    }
                } else {
                    self.isSignUpButtonEnabled = false
                }
            }
            .store(in: &cancellables)
    }
    
    private func validateInput(
        email: String,
        password: String,
        username: String
    ) -> Bool {
        guard Validation.isValidEmail(email),
              Validation.isStrongPassword(password),
              !username.isEmpty
        else {
            return false
        }
        
        return true
    }
    
    private func checkUsernameAvailability(for username: String) async throws -> Bool {
        // swiftlint:disable:next identifier_name
        let db = Firestore.firestore()
        
        let usersRef = db.collection("users")
        let query = usersRef.whereField("username", isEqualTo: username)
        
        let snapshot = try await query.getDocuments()
        
        return snapshot.isEmpty
    }
    
    func createScribbleID() async throws {
        try await SCIDAuthService.shared.createUser(
            email: email,
            password: password,
            username: username
        )
        
        // Resetting published properties after user creation
        username = ""
        password = ""
        email = ""
    }
    
    deinit {
        cancellables.removeAll()
    }
}
