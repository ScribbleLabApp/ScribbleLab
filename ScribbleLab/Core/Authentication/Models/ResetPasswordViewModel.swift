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

class ResetPasswordViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var errorString: String?
    @Published var isAlertShown: Bool = false
    
    @MainActor
    func resetPasswordHandler() {
        SCIDAuthService.resetPassword(email: email) { [weak self] res in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch res {
                case .failure(let error):
                    ScribbleLabApp().logger.error(
                        "Failed to reset password with error \(error.localizedDescription)"
                    )
                    self.errorString = error.localizedDescription
                    self.isAlertShown = true
                case .success:
                    ScribbleLabApp().logger.log("Password reset succeeded")
                    self.isAlertShown = true
                }
            }
        }
    }
}
