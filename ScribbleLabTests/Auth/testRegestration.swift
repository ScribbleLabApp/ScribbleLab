//
//  testRegestration.swift
//  ScribbleLabTests
//
//  Created by Nevio Hirani on 02.12.23.
//

import XCTest
import Combine
@testable import ScribbleLab

@MainActor
class RegistrationViewModelTests: XCTestCase {
    var viewModel: RegistrationViewModel!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        viewModel = RegistrationViewModel()
        cancellables = Set<AnyCancellable>()
    }
    
    override func tearDown() {
        viewModel = nil
        cancellables = nil
        super.tearDown()
    }
    
    func testSignUpButtonEnabled() {
        // Given
        let expectation = self.expectation(description: "SignUpButtonExpectation")
        var buttonEnabledStatus = false
        
        // When
        viewModel.$isSignUpButtonEnabled
            .dropFirst() // Skip the initial value
            .sink { value in
                buttonEnabledStatus = value
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        // Simulate changes in username, email, and password
        viewModel.username = "test1212"
        viewModel.email = "test12@gmail.com"
        viewModel.password = "test1212"
        
        // Then
        waitForExpectations(timeout: 1) { error in
            XCTAssertTrue(buttonEnabledStatus, "Sign up button should be enabled with valid inputs")
        }
    }
}
