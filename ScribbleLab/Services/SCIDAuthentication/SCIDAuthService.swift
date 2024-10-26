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
import Firebase
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
    ///
    /// - Parameters:
    ///   - email: The email for login.
    ///   - password: The password for login.
    func logIn(
        withEmail email: String,
        password: String
    ) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email,
                                                      password: password)
            self.userSession = result.user
            try await loadUserData()
        } catch {
            ScribbleLabApp().logger.error(
                "Failed to log in with error \(error.localizedDescription) - AUT-E101"
            )
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
    func createUser(
        email: String,
        password: String,
        username: String
    ) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email,
                                                          password: password)
            self.userSession = result.user
            await uploadUserData(
                uid: result.user.uid,
                username: username,
                email: email
            )
        } catch {
            ScribbleLabApp().logger.error(
                "Failed to create user with error \(error.localizedDescription) - AUT-E102"
            )
        }
    }
    
    /// Loads user data for the currently authenticated user.
    ///
    /// This function asynchronously loads user data for the currently authenticated user.
    /// It retrieves user session information and fetches the corresponding user data based on the session UID.
    /// The loaded user information includes details like username, email, etc.
    ///
    /// - Throws: An error if there's an issue while loading user data.
    func loadUserData() async throws {
        self.userSession = Auth.auth().currentUser
        guard let currentUid = userSession?.uid else { return }
        self.currentUser = try await SCIDUserService.fetchUser(withUid: currentUid)
    }
    
    /// Signs the current user out of the application.
    ///
    /// This function signs out the current user session from the application.
    /// It revokes the authentication session and clears any user-related data in the app.
    ///
    /// The function sets the user session and current user information to `nil` after sign-out.
    ///
    /// - Note: Any unsaved data or changes might be lost after calling this function.
    nonisolated func signOut() {
        Task {
            do {
                try Auth.auth().signOut()

                await MainActor.run {
                    self.userSession = nil
                    self.currentUser = nil
                }
            } catch {
                await ScribbleLabApp().logger.error(
                    "Failed to sign out due to error \(error.localizedDescription) - AUT-E103"
                )
            }
        }
    }
    
    /// Sends a password reset request for the provided email.
    ///
    /// This function initiates a password reset request for the given email address.
    ///
    /// - Parameters:
    ///   - email: The email address for which the password reset is requested.
    ///   - resetCompletion: A closure indicating the result of the password reset request.
    ///
    /// - Note: The result is delivered asynchronously via the provided closure.
    static func resetPassword(
        email: String,
        resetCompletion: @escaping (Result<Bool, any Error>
    ) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if let error = error {
                resetCompletion(.failure(error))
            } else {
                resetCompletion(.success(true))
            }
        }
    }
    
    /// Uploads user data to Firestore.
    ///
    /// This private function creates a user object using the provided details, sets it as the current user,
    /// encodes it, and then uploads it to Firestore.
    ///
    /// - Parameters:
    ///   - uid: The unique identifier for the user.
    ///   - username: The username associated with the user.
    ///   - email: The email address associated with the user.
    ///   - usrRole: The role of the user (intern, developer, etc.).
    ///   - hasPremium: A Boolean indicating whether the user has a premium account.
    ///
    /// - Note: This function sets the current user with the provided details and uploads it to Firestore.
    ///         It is a private function and should be called from within the `SLAuthService`.
    ///
    /// > WARNING
    /// > This function is called internally by the `SCIDAuthService` and should not typically be accessed directly.
    func uploadUserData(
        uid: String,
        username: String,
        email: String,
        usrRole: SCIDUserRole = .none,
        hasPremium: Bool = false
    ) async {
        let user = SLUser(
            id: uid,
            username: username,
            email: email,
            usrRole: usrRole,
            hasPremium: hasPremium
        )
        self.currentUser = user
        
        do {
            let encodedUser = try JSONEncoder().encode(user)
            if let userData = try JSONSerialization.jsonObject(
                with: encodedUser,
                options: []
            ) as? [String: Any] {
                try await Firestore.firestore().collection("users").document(user.id).setData(userData)
            }
        } catch {
            ScribbleLabApp().logger.error(
                "Failed to upload user data \(error.localizedDescription) - SLUSRS-E204"
            )
        }
    }
}
