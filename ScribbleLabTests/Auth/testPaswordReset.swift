//
//  testPaswordReset.swift
//  ScribbleLabTests
//
//  Created by Nevio Hirani on 02.12.23.
//

import XCTest
@testable import ScribbleLab

/// Verifies the functionality of password reset handling within `ResetPasswordModel`.
///
final class testPaswordReset: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - Test Methods
    
    /// Verifies the success scenario of password reset handling.
    ///
    /// This test method validates that the password reset process in the `ResetPasswordModel`
    /// succeeds when the provided email is valid.
    ///
    /// - Throws: Errors if any assertions fail during the test execution.
    ///
    @MainActor
    func testResetPasswordHandlerSuccess() {
        // Given
        let resetModel = ResetPasswordModel()
        let email = "n3v1010@gmail.com"
        
        resetModel.email = email
        
        let expectation = self.expectation(description: "PasswordResetSuccess")
        
        // When
        resetModel.resetPasswordHandler()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            // Simulating the success scenario of password reset
            SLAuthService.resetPassword(email: email) { result in
                switch result {
                case .failure:
                    XCTFail("Password reset should succeed")
                case .success:
                    expectation.fulfill()
                }
            }
        }
        
        // Then
        waitForExpectations(timeout: 1) { error in
            XCTAssertNil(error, "Expectation should not error")
            XCTAssertTrue(resetModel.alertIsShown, "Alert should be shown after password reset")
            XCTAssertNil(resetModel.errString, "Error string should be nil after successful password reset")
        }
    }
    
    /// Verifies the failure scenario of password reset handling.
    ///
    /// This test method validates that the password reset process in the `ResetPasswordModel`
    /// fails when the provided email is invalid.
    ///
    /// - Throws: Errors if any assertions fail during the test execution.
    ///
    @MainActor
    func testResetPasswordHandlerFailure() {
        // Given
        let resetModel = ResetPasswordModel()
        let invalidEmail = "invalideEmail"
        
        resetModel.email = invalidEmail
        
        let expectation = self.expectation(description: "PasswordResetFailure")
        
        // When
        resetModel.resetPasswordHandler()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            // Simulating the failure scenario of password reset
            SLAuthService.resetPassword(email: invalidEmail) { result in
                switch result {
                case .failure:
                    expectation.fulfill()
                case .success:
                    XCTFail("Password reset should fail")
                }
            }
        }
        
        // Then
        waitForExpectations(timeout: 1) { error in
            XCTAssertNil(error, "Expectation should not error")
            XCTAssertTrue(resetModel.alertIsShown, "Alert should be shown after password reset")
            XCTAssertNotNil(resetModel.errString, "Error string should contain error description after failed password reset")
        }
    }

}
