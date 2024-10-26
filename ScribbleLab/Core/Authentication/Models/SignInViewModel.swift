//
//  SignInViewModel.swift
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

class SignInViewModel: ObservableObject {
    
    /// Published property holding the entered email.
    @Published var password: String = ""
    
    /// Published property holding the entered password.
    @Published var email: String = ""
    
    /// Published property determining if the log-in button is enabled.
    ///
    /// The button is enabled when the entered password contains at least 8 characters,
    /// the email contains an '@', and the username is not empty.
    ///
    @Published var loginButtonDisabled: Bool = true
    
    var cancellables = Set<AnyCancellable>()
    
    // I have no f*** clue of what is happening here right now - Never touch this pice of
    // code or else you'll die
    // Thank you very much for your understanding
    // Whishing you a great day!
    init() {
        $email
            .combineLatest($password)
            .map { [weak self] email, password in
                self?.validateInput(email: email, password: password) ?? false
            }
            .assign(to: \.loginButtonDisabled, on: self)
            .store(in: &cancellables)
    }
    
    /// Validates the email and password for login.
    /// - Parameters:
    ///   - email: The email to validate.
    ///   - password: The password to validate.
    /// - Returns: A boolean indicating whether the input is valid for login.
    private func validateInput(email: String, password: String) -> Bool {
        return !email.isEmpty && validateEmail(withEmail: email) && password.count >= 8
    }
    
    private func validateEmail(withEmail email: String) -> Bool {
        return Validation.isValidEmail(email)
    }
    
    func signIn() async throws {
        try await SCIDAuthService.shared.logIn(withEmail: email, password: password)
    }
    
    deinit {
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
        
        Task {
            await ScribbleLabApp().logger.log(
                "SignInViewModel succesfully deinitialized - SCRG-S0"
            )
        }
    }
}
