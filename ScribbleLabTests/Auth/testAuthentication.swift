//
//  testAuthentication.swift
//  ScribbleLabTests
//
//  Created by Nevio Hirani on 01.12.23.
//

import XCTest
@testable import ScribbleLab

/// Suite of tests for validating authentication functionalities within `SLAuthService`.
///
/// This test suite verifies various authentication operations within `SLAuthService`, ensuring proper functioning of login, user creation, data loading, and sign out functionalities.
///
/// - Important: These tests focus on asynchronous operations that authenticate users and manipulate user sessions. Ensure proper network connectivity and valid test data for accurate validation.
///
final class testAuthentication: XCTestCase {
    var authService: SLAuthService!

    override func setUpWithError() throws {
        try super.setUpWithError()
        authService = SLAuthService.shared
    }

    override func tearDownWithError() throws {
        authService = nil
        try super.tearDownWithError()
    }

    /// Verifies successful login operation.
    ///
    /// This test ensures that the login process authenticates the user successfully, resulting in a valid user session and current user information.
    ///
    func testLogIn() async throws {
        // Given Data
        let email = "test10@gmail.com"
        let password = "test1010"
        
        // When
        try await authService.logIn(withEmail: email, password: password)
        
        // Then
        XCTAssertNotNil(authService.userSession, "User session should not be nil after login")
        XCTAssertNotNil(authService.currentUser, "Current user should not be nil after login")
    }

    /// Validates user creation process.
    ///
    /// This test ensures that creating a new user with valid credentials results in a valid user session and current user information.
    ///
    func testCreateUser() async throws {
        // Given
        let email = "test11@gmail.com"
        let password = "test1111"
        let username = "test1111"
        
        // When
        try await authService.createUser(email: email, password: password, username: username)
        
        // Then
        XCTAssertNotNil(authService.userSession, "User session should not be nil after creating a user")
        XCTAssertNotNil(authService.currentUser, "Current user should not be nil after creating a user")
    }
    
    /// Validates user data loading process.
    ///
    /// This test verifies that loading user data retrieves a valid user session and current user information.
    ///
    func testLoadUserData() async throws {
        // When
        try await authService.loadUserData()
        
        // Then
        XCTAssertNotNil(authService.userSession, "User session should not be nil while loading user data")
        XCTAssertNotNil(authService.currentUser, "Current user should not be nil while loading user data")
    }
    
    /// Verifies user sign-out process.
    ///
    /// This test ensures that signing out clears user sessions and current user information, resulting in nil values for both.
    ///
    func testSignOut() async throws {
        // When
        authService.signOut()
        
        // Then
        XCTAssertNil(authService.userSession, "User session should be nil after signing out")
        XCTAssertNil(authService.currentUser, "Current user should be nil after signing out")
    }

}
