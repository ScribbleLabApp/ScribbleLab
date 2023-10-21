//
//  User.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 21.10.23.
//

import Foundation
import Firebase

struct User: Identifiable, Hashable, Codable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    let email: String
    
    var iscurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}

// MOCK Users for testing purposes
extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "test1", profileImageUrl: nil, fullname: "Test 1", email: "test@gmail.com"),
        .init(id: NSUUID().uuidString, username: "test2", profileImageUrl: nil, fullname: "Test 2", email: "test2@gmail.com"),
    ]
}
