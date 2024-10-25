//
//  User.swift
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

/// A model that represents a user in the ScribbleLab application.
///
/// `SLUser` holds essential user information, such as a unique identifier, username, email, and profile image URL.
/// Additionally, it offers a computed property to determine if the `SLUser` instance represents the currently
/// logged-in user.
///
/// - Note: `SLUser` conforms to `Identifiable`, `Hashable`, and `Codable`, making it suitable for lists, comparison,
///         and serialization.
struct SLUser: Identifiable, Hashable, Codable {
    
    /// The unique identifier for the user.
    ///
    /// - Note: This ID is typically assigned by the authentication system (e.g., Firebase) and is immutable.
    let id: String
    
    /// The user’s chosen display name.
    ///
    /// - Important: `username` must be unique across all users in the application for accurate identification.
    var username: String = ""
    
    /// An optional URL string pointing to the user’s profile image.
    ///
    /// This image is displayed as the user’s avatar within the application. If `nil`, a default image can be used.
    var profileImageUrl: String?
    
    /// The user's full name.
    ///
    /// This is the complete name as entered by the user, which may include first and last names.
    var fullname: String? = ""
    
    /// The user’s email address.
    ///
    /// This is a unique, immutable property for each user, used for authentication and notifications.
    let email: String
    
    /// A computed property that indicates whether this `SLUser` instance represents the current authenticated user.
    ///
    /// - Returns: `true` if the current authenticated user's ID matches this user's ID, otherwise `false`.
    ///
    /// - Note: Uses `FirebaseAuth` to verify the user identity, so it requires the FirebaseAuth framework.
    var iscurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}
