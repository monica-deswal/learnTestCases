//
//  MockSignupViewDelegate.swift
//  LearnTestCaseBaseBranchTests
//
//  Created by Monica Deshwal on 28/01/24.
//

import Foundation
import XCTest
@testable import LearnTestCaseBaseBranch

class MockSignupViewDelegate: SignupViewDelegateProtocol {
    var expectation: XCTestExpectation?
    
    func successfulSignup() {
        expectation?.fulfill()
    }
    
    func errorHandler(error: LearnTestCaseBaseBranch.SignUpErrors) {
        
    }
}
