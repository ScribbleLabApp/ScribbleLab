//
//  testLogIn.swift
//  ScribbleLabTests
//
//  Created by Nevio Hirani on 02.12.23.
//

import XCTest
import Combine
@testable import ScribbleLab

class LoginViewModelTests: XCTestCase {
    var viewModel: LoginViewModel!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        viewModel = LoginViewModel()
        cancellables = Set<AnyCancellable>()
    }
    
    override func tearDown() {
        viewModel = nil
        cancellables = nil
        super.tearDown()
    }
    
    func testLoginButtonEnabled() {
        // Given
        let expectation = self.expectation(description: "LoginButtonExpectation")
        var buttonEnabledStatus = false
        
        // When
        viewModel.$isLogInButtonEnabled
            .dropFirst() // Skip the initial value
            .sink { value in
                buttonEnabledStatus = value
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        // Simulate changes in email and password
        viewModel.email = "test11@gmail.com"
        viewModel.password = "test1111"
        
        // Then
        waitForExpectations(timeout: 1) { error in
            XCTAssertTrue(buttonEnabledStatus, "Login button should be enabled with valid inputs")
        }
    }
}
