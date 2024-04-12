//
//  Security.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 16.12.23.
//

import Foundation
import LocalAuthentication

/// Typealias for biometric authentication completion handler
typealias BiometricUnlockCompletion = (Bool, Error?) -> Void

/// Performs biometric authentication using Face ID/Touch ID.
///
/// - Parameters:
///    - completion: A closure indicating the result of the authentication.
///      The closure has two parameters:
///        - success: A Boolean value indicating whether the authentication was successful.
///        - error: An optional `Error` object containing details in case of failure.
///
/// ## Example Usage:
/// ```swift
/// // Calling unlockWithBiometrics
/// unlockWithBiometrics { success, error in
///     if success {
///         // Biometric authentication succeeded
///         // Perform actions after successful authentication
///     } else if let error = error {
///         // Handle authentication error
///     } else {
///         // Handle generic authentication failure
///     }
/// }
/// ```
func unlockWithBiometrics(completion: @escaping BiometricUnlockCompletion) {
    let context = LAContext()
    var error: NSError?
    
    // Check whether biometric authentication is possible
    if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
        let reason = "Unlock with Face ID/Touch ID to open ScribbleLab"
        
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                               localizedReason: reason) { success, authenticationError in
            DispatchQueue.main.async {
                if success {
                    completion(true, nil)
                } else if let error = authenticationError {
                    completion(false, error)
                } else {
                    completion(
                        false,
                        NSError(
                            domain: "ScribbleLab", 
                            code: -1,
                            userInfo: [NSLocalizedDescriptionKey: "Biometric authentication failed."]
                        )
                    )
                }
            }
        }
    } else {
        // Biometrics not enabled or available
        completion(false, error)
    }
}
