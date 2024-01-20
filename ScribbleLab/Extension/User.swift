//
//  User.swift
//  ScribbleLabCore
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

import Foundation
import Firebase

struct User: Identifiable, Hashable, Codable {
    let id: String
    var username: String = ""
    var profileImageUrl: String? = nil
    var fullname: String? = ""
    let email: String
    
    var iscurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}

// MOCK Users for testing purposes
extension User {
    // swiftlint:disable identifier_name
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "test1", 
              profileImageUrl: nil, fullname: "Test 1", 
              email: "test@gmail.com"),
        .init(id: NSUUID().uuidString, username: "test2",
              profileImageUrl: nil, fullname: "Test 2", 
              email: "test2@gmail.com"),
    ]
    // swiftlint:enable identifier_name
}
