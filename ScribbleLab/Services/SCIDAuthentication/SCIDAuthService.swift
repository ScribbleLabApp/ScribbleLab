//
//  SLAuthService.swift
//  ScribbleLab
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

import Foundation
import FirebaseAuth
import ScribbleFoundation

@MainActor
class SCIDAuthService: Authenticatable {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: SLUser?
    
    public static let shared = SCIDAuthService()
    
    init() {
        Task { try await loadUserData() }
    }
    
    /// Attempts to log in with the provided email and password asynchronously.
    /// - Parameters:
    ///   - email: The email for login.
    ///   - password: The password for login.
    ///
    func logIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await loadUserData()
        } catch {
            ScribbleLabApp().logger.error("Failed to log in with error \(error.localizedDescription)")
        }
    }
    
    // TODO: Add password-less authentication
    
    /// Creates a new user account with the provided email, password, and username.
    ///
    /// This function attempts to create a new user account with the given email, password, and username asynchronously.
    ///
    /// - Parameters:
    ///   - email: The email for the new user account.
    ///   - password: The password for the new user account.
    ///   - username: The username for the new user account.
    ///
    /// - Throws: An error if user registration fails.
    ///
    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            await uploadUserData(uid: result.user.uid, username: username, email: email)
        } catch {
            ScribbleLabApp().logger.error("Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func loadUserData() async throws {
        self.userSession = Auth.auth().currentUser
        guard let currentUid = userSession?.uid else { return }
//        self.currentUser = try await
    }
    
    nonisolated func signOut() {
        
    }
    
    static func resetPassword(email: String, resetCompletion: @escaping (Result<Bool, any Error>) -> Void) {
        
    }
    
    func uploadUserData(uid: String, username: String, email: String) async {
        
    }
    
    
}
