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
        let expectation = XCTestExpectation(description: "Sign Up Button Enabled")
        var buttonEnabledStatus = false
        
        let cancellable = viewModel.$isSignUpButtonEnabled
            .dropFirst() // Skip the initial value
            .sink { isEnabled in
                buttonEnabledStatus = isEnabled
                expectation.fulfill()
            }
        
        viewModel.username = "test1111"
        viewModel.email = "test11@gmail.com"
        viewModel.password = "test1111"
        
        // When & Then
        wait(for: [expectation], timeout: 1)
        cancellable.cancel() // Cancel the subscription
        
        XCTAssertTrue(buttonEnabledStatus, "Sign up button should be enabled with valid inputs")
    }
}
