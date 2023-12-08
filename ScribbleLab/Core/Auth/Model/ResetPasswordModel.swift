//
//  ResetPasswordModel.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 02.12.23.
//

import Foundation
import FirebaseAuth
import os.log


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
