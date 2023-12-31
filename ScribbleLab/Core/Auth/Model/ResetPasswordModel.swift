//
//  ResetPasswordModel.swift
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

import os.log
import Foundation

import FirebaseAuth


/// A model responsible for handling password reset functionality.
///
/// This model provides functionality to reset passwords using `SLAuthService`.
///
/// Example usage:
/// ```swift
/// let resetModel = ResetPasswordModel()
/// resetModel.email = "example@example.com"
/// resetModel.resetPasswordHandler()
/// ```
///
class ResetPasswordModel: ObservableObject {
    @Published var email = ""
    @Published var alertIsShown = false
    @Published var errString: String?
    
    /// Initiates the password reset process.
    ///
    /// This method calls `SLAuthService.resetPassword` to reset the password for the provided email address.
    ///
    /// - Note: The result is delivered asynchronously via a closure.
    /// - Note: Logs the success or failure of the password reset using `os_log`.
    ///         Success is logged with the info type, and failure is logged with the error type.
    ///
    @MainActor
    func resetPasswordHandler() {
        SLAuthService.resetPassword(email: email) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .failure(let error):
                self.errString = error.localizedDescription
                os_log("Password reset failed: %@", log: .default, type: .error, error.localizedDescription)
            case .success:
                os_log("Password reset succeeded", log: .default, type: .info)
                break
            }
            self.alertIsShown = true
        }
    }
}
