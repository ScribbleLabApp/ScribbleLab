//
//  SLAuthService.swift
//  ScribbleLabAuth
//
//  Created by Nevio Hirani on 21.10.23.
//  ScribbleLab restricted use only.
//  2023 - 2024 © ScribbleLab App. All right reserved
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreSwift
import Firebase
import FirebasePerformance

/// ScribbleLab's service responsible for managing user authentication and data operations.
///
/// This class handles various authentication tasks such as user login, registration, session management,
/// and interaction with Firestore to store and retrieve user-related data.
///
/// ### Usage:
/// - Use the `shared` singleton instance to access authentication functionalities throughout the app. Or call `SLAuth.funcName()`.
/// - Access methods like `logIn`, `createUser`, `signOut`, etc., to perform authentication operations.
///
/// This service provides various methods to handle user authentication, registration, and session management,
/// enabling developers to integrate robust user authentication mechanisms into their applications.
///
class SLAuthService {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    static let shared = SLAuthService()
    
    init() {
        Task { try await loadUserData() }
    }
    
    /// Attempts to log in with the provided email and password asynchronously.
    /// - Parameters:
    ///   - email: The email for login.
    ///   - password: The password for login.
    ///
    @MainActor
    func logIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await loadUserData()
        } catch {
            print("DEBUG: Failed to log in with error \(error.localizedDescription)")
        }
    }
    
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
    @MainActor
    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            await uploadUserData(uid: result.user.uid, username: username, email: email)
        } catch {
            print("DEBUG: Failed to register user with error \(error.localizedDescription)")
        }
    }
    
    /// Loads user data for the currently authenticated user.
    ///
    /// This function asynchronously loads user data for the currently authenticated user.
    /// It retrieves user session information and fetches the corresponding user data based on the session UID.
    /// The loaded user information includes details like username, email, etc.
    ///
    /// - Throws: An error if there's an issue while loading user data.
    ///
    @MainActor
    func loadUserData() async throws {
        self.userSession = Auth.auth().currentUser
        guard let currentUid = userSession?.uid else { return }
        self.currentUser = try await UserService.fetchUser(withUid: currentUid)
        //                let snapshot = try await Firestore.firestore().collection("users").document(currentUid).getDocument()
        //                self.currentUser = try? snapshot.data(as: User.self)
    }
    
    /// Signs the current user out of the application.
    ///
    /// This function signs out the current user session from the application.
    /// It revokes the authentication session and clears any user-related data in the app.
    ///
    /// The function sets the user session and current user information to `nil` after sign-out.
    ///
    /// Note: Any unsaved data or changes might be lost after calling this function.
    ///
    func signOut() {
        try? Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil
    }
    
    /// Sends a password reset request for the provided email.
    ///
    /// This function initiates a password reset request for the given email address.
    ///
    /// - Parameters:
    ///   - email: The email address for which the password reset is requested.
    ///   - resetCompletion: A closure indicating the result of the password reset request.
    ///
    /// ### Usage:
    /// ```swift
    /// SLAuthService.resetPassword(email: "example@example.com") { result in
    ///     switch result {
    ///     case .success(let success):
    ///         print("Password reset success: \(success)")
    ///     case .failure(let error):
    ///         print("Password reset failed with error: \(error.localizedDescription)")
    ///     }
    /// }
    /// ```
    /// - Note: The result is delivered asynchronously via the provided closure.
    ///
    @MainActor
    static func resetPassword(email: String, resetCompletion:@escaping (Result<Bool, Error>) -> Void) {
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
    /// This private function creates a user object using the provided details, sets it as the current user, encodes it, and then uploads it to Firestore.
    ///
    /// - Parameters:
    ///   - uid: The unique identifier for the user.
    ///   - username: The username associated with the user.
    ///   - email: The email address associated with the user.
    ///
    /// - Note: This function sets the current user with the provided details and uploads it to Firestore. It is a private function and should be called from within the `SLAuthService`.
    ///
    /// ### Usage:
    /// This function is called internally by the `SLAuthService` and should not typically be accessed directly.
    /// 
    private func uploadUserData(uid: String, username: String, email: String) async {
        let user = User(id: uid, username: username, email: email)
        self.currentUser = user
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
}
