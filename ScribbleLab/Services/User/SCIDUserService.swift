//
//  SCIDUser.swift
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
import Firebase
import ScribbleFoundation

struct SCIDUserService {
    static func fetchUser(withUid uid: String) async throws -> SLUser {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        
        guard let data = snapshot.data(),
              let id = data["id"] as? String,
              let username = data["username"] as? String,
              let email = data["email"] as? String else {
            throw NSError(
                domain: "SCIDUserService",
                code: -201,
                userInfo: [NSLocalizedDescriptionKey: "User data not found or invalid - SLUSR-E201"]
            )
        }

        let profileImageUrl = data["profileImageUrl"] as? String
        let fullname = data["fullname"] as? String

        return SLUser(
            id: id,
            username: username,
            profileImageUrl: profileImageUrl,
            fullname: fullname,
            email: email
        )
    }
    
    static func fetchAllUsers() async throws -> [SLUser] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        
        return snapshot.documents.compactMap { document in
            let data = document.data()
            guard let id = data["id"] as? String,
                  let username = data["username"] as? String,
                  let email = data["email"] as? String else { return nil }
            
            let profileImageUrl = data["profileImageUrl"] as? String
            let fullname = data["fullname"] as? String
            
            return SLUser(
                id: id,
                username: username,
                profileImageUrl: profileImageUrl,
                fullname: fullname,
                email: email
            )
        }
    }
}
