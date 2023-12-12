//
//  SignInWithGoogleModel.swift
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

import SwiftUI

import Firebase
import GoogleSignIn

class SignInWithGoogleModel: ObservableObject {
    @Published var isLoginSuccessed: Bool = false
    
    func signInWithGoogle() {
        // MARK: Get the AppClients ID
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // MARK: Create GoogleSignIn configuartion object
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        // MARK: SignIn method
        GIDSignIn.sharedInstance.signIn(withPresenting:  Application_utility.rootViewController) { user, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard
                let user = user?.user,
                let idToken = user.idToken else { return }
            
            let accessToken = user.accessToken
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)
            
            Auth.auth().signIn(with: credential) { res, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                guard let user = res?.user else { return }
                print(user)
            }
        }
    }
}
