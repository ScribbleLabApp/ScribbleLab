//
//  SCIDError.swift
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

/// A comprehensive list of errors that can occur within the ScribbleLabApp identity and user services.
///
/// The `SCIDError` enum categorizes errors into those related to Google authentication processes, such as
/// OAuth flows and user sign-ins, and errors encountered in user data retrieval and handling. Each error case
/// provides contextual information and a standardized error code to support debugging and enhance error
/// tracking throughout the app.
///
/// - Note: These error codes can be used in logging and alerting systems to quickly identify the
///         error source and cause.
internal enum SCIDError: Error {
    
    /// The client ID required for Google Sign-In is missing.
    ///
    /// This error occurs if the app is unable to retrieve the necessary client ID to initiate Google OAuth
    /// authentication. The absence of this ID prevents the app from making the initial connection with
    /// Google’s authentication services.
    ///
    /// - Error Code: `GID-E115`
    case missingClientID
    
    /// Failed to present the OAuth consent sheet for Google Sign-In.
    ///
    /// This error is encountered when the app cannot display the OAuth consent sheet, which is
    /// required for users to grant permissions to their Google account. This may happen due to
    /// UI-related constraints or network issues.
    ///
    /// - Error Code: `GID-E110`
    case failedOAuthSheet
    
    
    /// The signed-in user or the ID token is unavailable after an attempt to sign in.
    ///
    /// This error is returned if the app fails to retrieve the expected user profile or ID token
    /// following a successful OAuth flow, potentially due to session timeouts or network interruptions.
    ///
    /// - Error Code: `GID-E116`
    case missingUserOrToken
    
    /// Google Sign-In failed due to an unknown error.
    ///
    /// This error generally occurs when the sign-in process does not complete successfully, either due
    /// to connectivity issues or unhandled exceptions during authentication.
    ///
    /// - Error Code: `GID-E118`
    case signInFailed
    
    /// The signed-in user object is unavailable after Google authentication completes.
    ///
    /// This error occurs when the user object is not retrievable even after a successful Google Sign-In.
    /// It is likely related to session handling or data parsing issues during the sign-in process.
    ///
    /// - Error Code: `GID-E119`
    case missingSignedInUser
    
    /// The user’s login attempt failed.
    ///
    /// This error represents a general failure in the login process. It may be caused by invalid credentials,
    /// connectivity issues, or other authentication-related errors.
    ///
    /// - Error Code: `AUT-E101`
    case logInFailed
    
    /// Failed to create a new user account.
    ///
    /// This error occurs when the app fails to establish a new user account, potentially due to server-side
    /// issues, invalid data inputs, or connectivity problems during account creation.
    ///
    /// - Error Code: `AUT-E102`
    case userCreationFailed
    
    /// The requested user data could not be found or was invalid.
    ///
    /// This error is encountered when attempting to fetch user data from the database, but the returned data
    /// is either missing or improperly formatted. This may occur if the user’s record does not exist or if data
    /// parsing fails.
    ///
    /// - Error Code: `SLUSR-E201`
    case userDataNotFound
    
    /// Required user fields are missing or incomplete in the retrieved data.
    ///
    /// This error is thrown when essential fields such as user ID, username, or email are missing in the
    /// retrieved user data, leading to incomplete user profiles. This may happen due to improper data
    /// entry or issues in database management.
    ///
    /// - Error Code: `SLUSR-E202`
    case missingRequiredUserFields
}
