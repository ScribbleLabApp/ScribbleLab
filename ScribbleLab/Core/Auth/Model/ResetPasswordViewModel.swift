//
//  ResetPasswordViewModel.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 28.10.23.
//

import Foundation
import FirebaseAuth
import SwiftUI

class ResetPasswordViewModel: ObservableObject {
    @Published var email = ""
    
    func createPasswordResetRequest() async throws {
        await SLAuthService.shared.resetPassword(email: email) { result in
            switch result {
            case .success(let success):
                if success {
                    print("DEBUG: Password request was send successful")
                } else {
                    print("DEBUG: Password request failed with error")
                }
            case .failure(let failure):
                // Handle the error case (e.g., display an error message)
                print("Password reset failed with error")
                /*
                 Alert(
                    title: Text("Reset Password Failed"),
                    message: Text("Alert Message"),
                    primaryButton: .cancel(Text("Cancel").bold()),
                    secondaryButton: .destructive(Text("Retry")) {
                        print("DEBUG: Retry Button was pressed")
                    }
                )
                 */
            }
        }
        
        email = ""
    }
}
