//
//  SignInWithGoogleViewModel.swift
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

import Foundation
import Firebase
import FirebaseAuth
import GoogleSignIn
import ScribbleFoundation

class SignInWithGoogleViewModel: ObservableObject {
    @Published var isLogInSucceded: Bool = false
    
    // swiftlint:disable:next function_body_length
    func proceedWithGoogle() {
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            Task {
                await ScribbleLabApp().logger.error(
                    "FIR/GID Client ID is not available. GID-E115"
                )
            }
            return
        }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        GIDSignIn.sharedInstance.signIn(
            withPresenting: Application_Utility.rootViewController
        ) { user, error in
            if let error = error {
                Task {
                    await ScribbleLabApp().logger.error(
                        "Failed to present GID OAuth sheet with error \(error.localizedDescription) - GID-E110"
                    )
                }
                return
            }
            
            guard let user = user?.user, let idToken = user.idToken else {
                Task {
                    await ScribbleLabApp().logger.error(
                        "User or ID Token is not available. GID-E116"
                    )
                }
                return
            }
            
            let accessToken = user.accessToken
            let credential = GoogleAuthProvider.credential(
                withIDToken: idToken.tokenString,
                accessToken: accessToken.tokenString
            )
            
            Auth.auth().signIn(with: credential) { res, error in
                if let error = error {
                    Task {
                        await ScribbleLabApp().logger.error(
                            "Failed to sign in using GID with error \(error.localizedDescription) - GID-E118"
                        )
                    }
                    return
                }
                
                guard let user = res?.user else {
                    Task {
                        await ScribbleLabApp().logger.error(
                            "User is not available after sign-in. - GID-E119")
                    }
                    return
                }
                print("User signed in: \(user.uid) - SCID-S0")
            }
        }
    }
}
