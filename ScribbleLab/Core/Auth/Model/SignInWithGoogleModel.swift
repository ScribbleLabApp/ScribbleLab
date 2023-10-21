//
//  SignInWithGoogleModel.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 21.10.23.
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
